Deface::Override.new(:virtual_path => "spree/layouts/spree_application",
                     :name => "remove_row_from_container_in_layout",
                     :remove_from_attributes => 'div.container',
                     :attributes => {:class => 'row'},
                     :disabled => false)
