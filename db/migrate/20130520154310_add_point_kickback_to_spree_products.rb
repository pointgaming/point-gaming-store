class AddPointKickbackToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :point_kickback, :integer
  end
end
