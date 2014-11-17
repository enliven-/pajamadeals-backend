class ListingsController < ApplicationController

  get '/index' do
    @listings = Listing.all

    @listings.collect! { |listing| listing.serialized_hash }

    json @listings
  end

  post '/create' do
    @listing = Listing.new(params[:listing])
    if @listing.save
      json @listing
    else
      # error
    end
  end
end
