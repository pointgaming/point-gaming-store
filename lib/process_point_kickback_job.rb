class ProcessPointKickbackJob
  @queue = :high

  def self.perform(order_id)
    order = Spree::Order.find(order_id)
    return if order.point_kickback_processed === true

    order.user.pg_user.increment_points!(order.point_kickback_total)
    order.point_kickback_processed = true
    order.save
  end
end
