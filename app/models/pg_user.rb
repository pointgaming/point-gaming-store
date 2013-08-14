class PgUser < ActiveResource::Base
  include ActiveResource::Extend::AuthWithApi

  self.site = "#{APP_CONFIG['main_app_api_url']}api/v1/"
  self.element_name = 'user'

  self.api_key = APP_CONFIG['api_auth_token']

  def id
    _id
  end

  def increment_points_for_order!(order)
    put(:increment_points_for_spree_order, {
      order_id: order.id,
      points: order.point_kickback_total
    })
  end
end
