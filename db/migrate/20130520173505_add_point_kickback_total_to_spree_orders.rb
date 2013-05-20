class AddPointKickbackTotalToSpreeOrders < ActiveRecord::Migration
  def change
    add_column :spree_orders, :point_kickback_total, :integer
  end
end
