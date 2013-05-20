class AddPointKickbackProcessedToSpreeOrders < ActiveRecord::Migration
  def change
    add_column :spree_orders, :point_kickback_processed, :boolean, default: false
  end
end
