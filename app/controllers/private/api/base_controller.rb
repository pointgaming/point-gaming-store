class Private::Api::BaseController < ActionController::Base
  include ::SslRequirement
  before_filter :authenticate_api!

  respond_to :json

protected

  # I'm not sure why ssl_allowed? was returning true, but it needs to return false for our private api
  def ssl_allowed?
    false
  end

  def authenticate_api!
    unless params[:api_token] && params[:api_token] === APP_CONFIG['api_auth_token']
      render :json => {:success=>false, :message=>"Failed to authenticate with the api"}, :status=>401
    end
  end

end
