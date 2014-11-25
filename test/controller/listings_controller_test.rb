require_relative '../test_helper'
class ListingsControllerTest < MiniTest::Test
  def app
    ListingsController
  end

  ## test index

  def test_index
    book1 = create :book, title: 'book 1'
    book2 = create :book, title: 'book 2'
    listing1 = create :listing, book: book1
    listing2 = create :listing, book: book2
    resp = [listing1.serialized_hash, listing2.serialized_hash].to_json

    get '/'

    assert last_response.ok?
    assert_equal resp, last_response.body
  end

  ## test show

  # context: record exists
  def test_show
    listing = create :listing
    id = listing.id

    get "/show/#{id}"

    assert last_response.ok?
    assert_equal listing.serialized_hash.to_json, last_response.body
  end

  # context: record doesn't exist

  # ....

  ## test create

  def test_create
    listing = build(:listing).attributes.except(:id, :created_at, :updated_at)
    listing_count = Listing.count

    post '/create', listing: listing

    assert last_response.ok?
    assert_equal listing_count + 1, Listing.count
  end

end
