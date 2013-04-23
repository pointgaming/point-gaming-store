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

  settings analysis: {
      analyzer: {
        partial_match: {
          tokenizer: :whitespace,
          filter: [:lowercase, :edge_ngram]
        }
      },
      filter: {
        edge_ngram: {
            side: :front,
            max_gram: 20,
            min_gram: 1,
            type: :edgeNGram
        }
      }
    } do
    mapping do
      indexes :_id, type: 'string', index: :not_analyzed, as: 'id'
      indexes :display_name, type: 'string', boost: 10, analyzer: 'snowball', as: 'name'
      indexes :prefix, type: 'string', index_analyzer: 'partial_match', search_analyzer: 'snowball', boost: 2, as: 'name'
      indexes :description, type: 'string', analyzer: 'snowball'
      indexes :url, type: 'string', :index => 'no', as: 'url'

      indexes :store_sort, type: 'short', :index => 'not_analyzed', as: 'store_sort'
      indexes :main_sort, type: 'short', :index => 'not_analyzed', as: 'main_sort'
      indexes :forum_sort, type: 'short', :index => 'not_analyzed', as: 'forum_sort'
    end
  end

end
