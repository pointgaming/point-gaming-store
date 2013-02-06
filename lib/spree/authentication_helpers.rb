module Spree
  module AuthenticationHelpers
    def self.included(receiver)
      receiver.send :helper_method, :spree_login_path
      receiver.send :helper_method, :spree_signup_path
      receiver.send :helper_method, :spree_logout_path
      receiver.send :helper_method, :spree_current_user
    end

    def spree_current_user
      current_user
    end

    def spree_login_path
      APP_CONFIG['login_url']
    end

    def spree_signup_path
      APP_CONFIG['signup_url']
    end

    def spree_logout_path
      APP_CONFIG['logout_url']
    end
  end
end

ApplicationController.send :include, Spree::AuthenticationHelpers
