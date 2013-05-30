module Spree
  Order.class_eval do

    # overrode this method so that I can add an item to the background queue
    # Finalizes an in progress order after checkout is complete.
    # Called after transition to complete state when payments will have been processed
    def finalize!
      ::Resque.enqueue ::ProcessPointKickbackJob, self.id if self.point_kickback_total > 0

      touch :completed_at

      # lock all adjustments (coupon promotions, etc.)
      adjustments.each { |adjustment| adjustment.update_column('state', "closed") }

      # update payment and shipment(s) states, and save
      updater.update_payment_state
      shipments.each do |shipment|
        shipment.update!(self)
        shipment.finalize!
      end

      updater.update_shipment_state
      save
      updater.run_hooks

      deliver_order_confirmation_email

      self.state_changes.create({
        previous_state: 'cart',
        next_state:     'complete',
        name:           'order' ,
        user_id:        self.user_id
      }, without_protection: true)
    end

  end
end
