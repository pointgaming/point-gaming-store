Deface::Override.new(
  name: 'add_point_kickback_fields_to_edit_form',
  virtual_path: 'spree/admin/products/_form',
  insert_after: '[data-hook=admin_product_form_right] :nth-child(8)',
  partial: 'spree/admin/products/point_kickback_field'
)
Deface::Override.new(
  name: 'add_point_kickback_fields_to_new_form',
  virtual_path: 'spree/admin/products/new',
  insert_bottom: '[data-hook=new_product_attrs]',
  partial: 'spree/admin/products/new_point_kickback_field'
)
Deface::Override.new(
  name: 'add_point_kickback_fields_to_product_show_page',
  virtual_path: 'spree/products/show',
  insert_after: '[itemprop=description]',
  partial: 'spree/products/point_kickback_field'
)
Deface::Override.new(
  name: 'add_point_kickback_fields_to_product_list_view',
  virtual_path: 'spree/shared/_products',
  insert_before: '[itemprop=price]',
  partial: 'spree/products/point_kickback_field_list_view'
)
Deface::Override.new(
  name: 'add_point_kickback_total_to_cart',
  virtual_path: 'spree/orders/edit',
  insert_before: 'div#subtotal',
  partial: 'spree/orders/point_kickback_total'
)
Deface::Override.new(
  name: 'add_point_kickback_total_to_checkout_summary',
  virtual_path: 'spree/checkout/_summary',
  insert_bottom: '[data-hook=order_summary]',
  partial: 'spree/checkout/point_kickback_summary'
)
