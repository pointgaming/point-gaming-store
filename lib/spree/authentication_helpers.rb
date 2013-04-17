module Spree
  module AuthenticationHelpers
    def self.included(receiver)
      receiver.send :helper_method, :spree_login_path
      receiver.send :helper_method, :spree_signup_path
      receiver.send :helper_method, :spree_logout_path
      receiver.send :helper_method, :spree_current_user
      receiver.send :helper_method, :pg_user_id
      receiver.send :helper_method, :current_pg_user
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

    def pg_user_id
      session.has_key?('warden.user.user.key') ? session['warden.user.user.key'].at(1).first : nil
    end

    def current_pg_user
      return nil unless spree_current_user

      @PgUser ||= PgUser.find(spree_current_user.slug)
    rescue
      nil
    end
  end
end

ApplicationController.send :include, Spree::AuthenticationHelpers
