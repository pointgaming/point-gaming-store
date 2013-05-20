module Spree
  Order.class_eval do

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

  end
end
