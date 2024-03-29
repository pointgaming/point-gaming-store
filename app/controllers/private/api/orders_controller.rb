class Private::Api::OrdersController < Private::Api::BaseController
  ssl_required :show
  before_filter :ensure_order, only: [:show]

  def show
    respond_with(@order.as_json({ methods: [:item_count, :products] }))
  end

private

  def ensure_order
    @order = Spree::Order.find params[:id]
    render :json => {:success=>false, :message=>"That order was not found"}, :status=>404 unless @order.present?
  end
end
