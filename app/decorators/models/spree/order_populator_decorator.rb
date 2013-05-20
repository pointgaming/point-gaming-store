module Spree
  OrderPopulator.class_eval do

    # overrode this to add the @order.update! call
    def populate(from_hash)
      from_hash[:products].each do |product_id,variant_id|
        attempt_cart_add(variant_id, from_hash[:quantity])
      end if from_hash[:products]

      from_hash[:variants].each do |variant_id, quantity|
        attempt_cart_add(variant_id, quantity)
      end if from_hash[:variants]

      @order.update!
      @order.save

      valid?
    end 

  end
end
