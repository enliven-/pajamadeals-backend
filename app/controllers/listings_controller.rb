class ListingsController < ApplicationController

  get '/' do
    @listings = Listing.all

    @listings.collect! { |listing| listing.serialized_hash }

    json @listings
  end

  get '/show/:id' do
    raise params.inspect
  end

  post '/create' do
    @listing = Listing.new(params[:listing])
    if @listing.save
      render @listing.to_json
    else
      # error
    end
  end
end
