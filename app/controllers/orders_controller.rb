class OrdersController < ApplicationController
  before do
    if params.present?
      params[:listing_id] = params[:listing_id].to_i \
                                         if params[:listing_id].present?
      params[:buyer_id] = params[:buyer_id].to_i if params[:buyer_id].present?
    end
  end

  post '/' do
    buyer_attributes = params.delete(:buyer_attributes)
    buyer = User.find_by(mobile: buyer_attributes[:mobile]) ||
                                                  User.create(buyer_attributes)

    order = Order.new(params)
    order.buyer = buyer
    if order.save
      json order.serialized_hash
    else
      # errou
    end
  end

  put '/' do
    order = Order.find(params[:id])
    if order.update(params)
      json order.serialized_hash
    else
      # error
    end
  end

  get '/' do
    params[:type] ||= :buy_orders
    user = User.find_by(mobile: params[:mobile])
    # halt 404, ActiveRecord::RecordNotFound
    if user.present?
      orders = user.try(params[:type])
      serialized_orders = orders.collect { |order| order.serialized_hash }
      json serialized_orders
    else
      json []
    end
  end

  get '/:id' do
    order = Order.find(params[:id])
    json order.serialized_hash
  end
end
