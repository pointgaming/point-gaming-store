class Order < ActiveResource::Base
  include ActiveResource::Extend::AuthWithApi

  self.site = APP_CONFIG['main_app_api_url']
  self.element_name = 'order'

  self.api_key = APP_CONFIG['api_auth_token']

  def log!(pg_user)
    put(:log, {
      slug: pg_user.slug
    })
  end
end
