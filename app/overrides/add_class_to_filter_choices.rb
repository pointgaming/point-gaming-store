Deface::Override.new(:virtual_path => "spree/shared/_filters",
                     :name => "add_class_to_shared_fitlers",
                     :add_to_attributes => 'ul.filter_choices',
                     :attributes => {:class => 'nav nav-list'},
                     :disabled => false)
