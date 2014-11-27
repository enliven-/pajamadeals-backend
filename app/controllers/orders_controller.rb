class OrdersController < ApplicationController
  before '/create' do
    if params[:order].present?
      params[:order][:listing_id] = params[:order][:listing_id].to_i \
                                         if params[:order][:listing_id].present?
      params[:order][:seller_id] = params[:order][:seller_id].to_i \
                                         if params[:order][:seller_id].present?
      params[:order][:buyer_id] = params[:order][:buyer_id].to_i \
                                         if params[:order][:buyer_id].present?
    end
  end

  post '/create' do
    order = Order.new(params[:order])
    if order.save
      # success
    else
      # errou
    end
  end
end
