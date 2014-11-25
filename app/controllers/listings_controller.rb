class ListingsController < ApplicationController
  before '/create' do
    # sanitaize params
    if params[:listing].present?
      params[:listing][:id]        = params[:listing][:id].to_i \
                                        if params[:listing][:id].present?
      params[:listing][:quality]   = params[:listing][:quality].to_i \
                                        if params[:listing][:quality].present?
      params[:listing][:markings]  = params[:listing][:markings].to_i \
                                        if params[:listing][:markings].present?
      params[:listing][:userd_id]  = params[:listing][:userd_id].to_i \
                                        if params[:listing][:userd_id].present?
      params[:listing][:bookd_id]  = params[:listing][:bookd_id].to_i \
                                        if params[:listing][:bookd_id].present?
      params[:listing][:imaged_id] = params[:listing][:imaged_id].to_i \
                                        if params[:listing][:imaged_id].present?

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

  post '/create' do
    @listing = Listing.new(params[:listing])

    if @listing.save
      json @listing.serialized_hash
    else
      # error
    end
  end
end
