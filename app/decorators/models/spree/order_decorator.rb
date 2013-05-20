module Spree
  Order.class_eval do

    # overrode this method so that I can set the point_kickback value for each item
    def add_variant(variant, quantity = 1, currency = nil)
      current_item = find_line_item_by_variant(variant)
      if current_item
        current_item.quantity += quantity
        current_item.currency = currency unless currency.nil?
        current_item.save
      else
        current_item = LineItem.new(:quantity => quantity)
        current_item.variant = variant
        if currency
          current_item.currency = currency unless currency.nil?
          current_item.price    = variant.price_in(currency).amount
        else
          current_item.price    = variant.price
        end
        current_item.point_kickback = variant.product.point_kickback
        self.line_items << current_item
      end 

      self.reload
      current_item
    end

    # overrode this method so that I can add an item to the background queue
    def finalize!
      ::Resque.enqueue ::ProcessPointKickbackJob, self.id if self.point_kickback_total > 0

      touch :completed_at
      InventoryUnit.assign_opening_inventory(self)

      # lock all adjustments (coupon promotions, etc.)
      adjustments.each { |adjustment| adjustment.update_column('locked', true) }

      # update payment and shipment(s) states, and save
      updater = OrderUpdater.new(self)
      updater.update_payment_state
      shipments.each { |shipment| shipment.update!(self) }
      updater.update_shipment_state
      save

      deliver_order_confirmation_email

      self.state_changes.create({
        :previous_state => 'cart',
        :next_state     => 'complete',
        :name           => 'order' ,
        :user_id        => self.user_id
      }, :without_protection => true)
    end

  end
end
