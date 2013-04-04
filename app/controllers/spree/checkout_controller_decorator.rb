module Spree
  CheckoutController.class_eval do

  private

    # we are overriding this method in order to substitue in the exisiting card information
    def object_params
      # For payment step, filter order parameters to produce the expected nested attributes for a single payment and its source, discarding attributes for payment methods other than the one selected
      if @order.payment?
        if params[:payment_source].present? && source_params = params.delete(:payment_source)[params[:order][:payments_attributes].first[:payment_method_id].underscore]
          if params[:use_payment_profile] && current_pg_user.present? && current_pg_user.stripe_customer_token.present?
            params[:order][:payments_attributes].first[:source_attributes] = {
              gateway_customer_profile_id: current_pg_user.stripe_customer_token,
              month: 0,
              year: 0
            }
          else
            params[:order][:payments_attributes].first[:source_attributes] = source_params
          end
        end
        if (params[:order][:payments_attributes])
          params[:order][:payments_attributes].first[:amount] = @order.total
        end
      end
      params[:order]
    end

  end
end
