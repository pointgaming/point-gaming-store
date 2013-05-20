module Spree
  LineItem.class_eval do

    def point_kickback_amount
      point_kickback * quantity
    end
    alias point_kickback_total point_kickback_amount

  end
end
