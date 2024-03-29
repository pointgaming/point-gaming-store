class PgUser < ActiveResource::Base
  include ActiveResource::Extend::AuthWithApi

  self.site = APP_CONFIG['main_app_api_url']
  self.element_name = 'user'

  self.api_key = APP_CONFIG['api_auth_token']

  def id
    _id
  end

end
