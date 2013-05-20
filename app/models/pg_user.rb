class PgUser < ActiveResource::Base
  include ActiveResource::Extend::AuthWithApi

  self.site = "#{APP_CONFIG['main_app_api_url']}api/v1/"
  self.element_name = 'user'

  self.api_key = APP_CONFIG['api_auth_token']

  def id
    _id
  end

  def increment_points!(amount)
    raise TypeError, "Amount must be a Fixnum." unless amount.class.name === 'Fixnum'

    put(:increment_points, {points: amount})
  end
end
