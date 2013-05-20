module ActiveResource::Extend::AuthWithApi
  module ClassMethods
    def element_path_with_auth(id, prefix_options = {}, query_options = {})
      query_options.merge!({:api_token => self.api_key})
      element_path_without_auth(id, prefix_options, query_options)
    end
    def collection_path_with_auth(prefix_options = {}, query_options = {})
      query_options.merge!({:api_token => self.api_key})
      collection_path_without_auth(prefix_options, query_options)
    end
  end

  def put_with_auth(action, options = {})
    options.merge!({:api_token => self.class.api_key})
    put_without_auth(action, options)
  end

  def self.included(base)
    base.class_eval do
      extend ClassMethods
      class << self
        alias_method_chain :element_path, :auth
        # alias_method_chain :new_element_path, :auth
        alias_method_chain :collection_path, :auth
        attr_accessor :api_key
      end
      alias_method_chain :put, :auth
    end
  end  
end
