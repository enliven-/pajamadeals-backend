class OrdersController < ApplicationController
  before do
    if params.present?
      params[:listing_id] = params[:listing_id].to_i \
                                         if params[:listing_id].present?
      params[:seller_id] = params[:seller_id].to_i \
                                         if params[:seller_id].present?
      params[:buyer_id] = params[:buyer_id].to_i if params[:buyer_id].present?
      params[:status] = params[:status].to_i if params[:status].present?
    end
  end

  post '/' do
    buyer_attributes = params.delete("buyer_attributes")

    buyer = User.find_by(mobile: buyer_attributes[:mobile]) ||
                                                  User.create(buyer_attributes)

    order = Order.new(params)
    order.buyer = buyer
    if order.save
      # success
    else
      # errou
    end
  end
end
