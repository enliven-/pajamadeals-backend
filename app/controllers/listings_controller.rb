class ListingsController < ApplicationController
  set(:method) do |method|
    method = method.to_s.upcase
    condition { request.request_method == method }
  end
  before '/', method: :post do
    # sanitaize params
    if params.present?
      params[:id]        = params[:id].to_i \
                                        if params[:id].present?
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
    params[:q] ||= '*'
    conditions = {}

    # default conditions
    conditions[:deleted] = false
    conditions[:spam]    = false
    conditions[:sold]    = false

    # params conditions
    if params[:college_id].present?
      college = College.find(params[:college_id])
      college_ids = college.nearest_colleges('1km').map(&:id)
      conditions[:college_id] = college_ids
    end
    conditions[:semester_id]    = params[:semester_id] if params[:semester_id]
    conditions[:department_id]  = params[:department_id] \
                                    if params[:department_id]
    conditions[:publication_id] = params[:publication_id] \
                                    if params[:publication_id]

    @listings = Listing.search(params[:q], where: conditions,
                               facets: [:college_id, :department_id,
                                        :publication_id, :semester_id],
                               smart_facets: true,
                               order: { created_at: :desc },
                               per_page: 20, page: params[:page]).results
    @listings.collect! { |listing| listing.serialized_hash }
    json @listings
  end

  get '/:id' do
    listing = Listing.find(params[:id])

    json listing.serialized_hash
  end

  post '/' do
    user_attributes = params.delete(:user_attributes)

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
