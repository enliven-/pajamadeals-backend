class ListingsController < ApplicationController
  before '/' do
    # sanitaize params
    if params.present?
      params[:id]        = params[:id].to_i \
                                        if params[:id].present?
      params[:quality]   = params[:quality].to_i \
                                        if params[:quality].present?
      params[:markings]  = params[:markings].to_i \
                                        if params[:markings].present?
      params[:userd_id]  = params[:userd_id].to_i \
                                        if params[:userd_id].present?
      params[:bookd_id]  = params[:bookd_id].to_i \
                                        if params[:bookd_id].present?
      params[:imaged_id] = params[:imaged_id].to_i \
                                        if params[:imaged_id].present?

      params[:user_attributes][:role] =
        params[:user_attributes][:role].to_i \
        if params[:user_attributes][:role].present?
    end
  end

  get '/' do
    @listings = Listing.all

    @listings.collect! { |listing| listing.serialized_hash }

    json @listings
  end

  get '/show/:id' do
    listing = Listing.find(params[:id])

    json listing.serialized_hash
  end

  post '/' do
    raise params.inspect
    user_attributes = params.delete("user_attributes")

    user = User.find_by(mobile: user_attributes[:mobile]) ||
                                                    User.create(user_attributes)

    @listing = Listing.new(params)
    @listing.user = user

    if @listing.save
      json @listing.serialized_hash
    else
      # error
    end
  end
end
