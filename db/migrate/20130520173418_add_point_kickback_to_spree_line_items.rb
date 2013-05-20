class AddPointKickbackToSpreeLineItems < ActiveRecord::Migration
  def change
    add_column :spree_line_items, :point_kickback, :integer
  end
end
