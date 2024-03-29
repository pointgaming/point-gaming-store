# This migration comes from spree (originally 20130802022321)
class MigrateTaxCategoriesToLineItems < ActiveRecord::Migration
  def change
  	Spree::LineItem.includes(:variant => { :product => :tax_category }).find_in_batches do |line_items|
  	  line_items.each do |line_item|
        unless line_item.product.tax_category.nil?
          line_item.update_column(:tax_category_id, line_item.product.tax_category.id)
        end
      end
    end
  end
end
