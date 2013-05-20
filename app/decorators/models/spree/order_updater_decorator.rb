module Spree
  OrderUpdater.class_eval do

    def update_totals
      order.payment_total = payments.completed.map(&:amount).sum
      order.item_total = line_items.map(&:amount).sum
      order.point_kickback_total = line_items.map(&:point_kickback_amount).sum
      order.adjustment_total = adjustments.eligible.map(&:amount).sum
      order.total = order.item_total + order.adjustment_total
    end

  end
end
