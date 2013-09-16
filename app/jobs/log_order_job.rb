class LogOrderJob
  @queue = :high

  def self.perform(order_id)
    order = Spree::Order.find(order_id)

    user = order.user.pg_user

    order_api = Order.new(id: order_id)
    order_api.log!(user)
  end
end
