Spree::BaseController.class_eval do
  before_filter :require_spree_user

  def require_spree_user
    unless try_spree_current_user
      redirect_to spree_login_path
    end 
  end
end
