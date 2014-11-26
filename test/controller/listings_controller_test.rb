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

  # def test_create
  #   listing = build(:listing).attributes.except(:id, :created_at, :updated_at)
  #   listing_count = Listing.count

  #   post '/create', listing: listing

  #   assert last_response.ok?
  #   assert_equal listing_count + 1, Listing.count
  # end

  def test_create_with_user_attributes_when_user_not_present
    book = create :book
    college = create :college
    listing = attributes_for(:listing)
              .merge(book_id: book.id)
              .merge(user_attributes: attributes_for(:user)
                .merge(college_id: college.id))
    listing_count = Listing.count
    user_count = User.count

    post '/create', listing: listing

    assert last_response.ok?
    assert_equal listing_count + 1, Listing.count
    assert_equal user_count + 1, User.count
  end

  def test_create_with_user_attributes_when_user_is_present
    book = create :book
    user = create :user
    listing = attributes_for(:listing)
              .merge(book_id: book.id)
              .merge(user_attributes: user.attributes.except("id", "role"))

    listing_count = Listing.count
    user_count = User.count

    post '/create', listing: listing

    assert last_response.ok?
    assert_equal listing_count + 1, Listing.count
    assert_equal user_count, User.count
  end

end
