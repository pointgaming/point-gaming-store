Spree::Product.class_eval do
  include Tire::Model::Search
  include Tire::Model::Callbacks
  include Spree::Core::Engine.routes.url_helpers

  def url
    product_url(self)
  end

  def store_sort
    0
  end

  def main_sort
    90
  end

  def forum_sort
    100
  end

  mapping do
    indexes :_id, type: 'string', index: :not_analyzed, as: 'id'
    indexes :display_name, type: 'string', boost: 10, analyzer: 'snowball', as: 'name'
    indexes :description, type: 'string', analyzer: 'snowball'
    indexes :url, type: 'string', :index => 'no', as: 'url'

    indexes :store_sort, type: 'short', :index => 'not_analyzed', as: 'store_sort'
    indexes :main_sort, type: 'short', :index => 'not_analyzed', as: 'main_sort'
    indexes :forum_sort, type: 'short', :index => 'not_analyzed', as: 'forum_sort'
  end

end
