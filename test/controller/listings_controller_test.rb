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

  def test_index_with_search_param_in_book_title
    book1 = create :book, title: 'Thoery of Machine'
    book2 = create :book, title: 'Design of Machine'
    listing1 = create :listing, book: book1
    listing2 = create :listing, book: book2
    Listing.reindex

    get '/', q: 'Design of Machine'
    resp = [listing2.serialized_hash].to_json
    assert last_response.ok?
    assert_equal resp, last_response.body

    get '/', q: 'Design'
    resp = [listing2.serialized_hash].to_json
    assert last_response.ok?
    assert_equal resp, last_response.body


    get '/', q: 'Machine'
    resp = [listing1.serialized_hash, listing2.serialized_hash].to_json
    assert last_response.ok?
    assert_equal resp, last_response.body
  end

  def test_index_with_search_param_in_subject
    subject1 = create :subject, name: 'Machine Design'
    subject2 = create :subject, name: 'Engineering Graphics'
    book1 = create :book, subject: subject1
    book2 = create :book, subject: subject2
    listing1 = create :listing, book: book1
    listing2 = create :listing, book: book2
    Listing.reindex

    get '/', q: 'Design'
    resp = [listing1.serialized_hash].to_json
    assert last_response.ok?
    assert_equal resp, last_response.body
  end

  def test_index_with_publication_filter
    publication1 = create :publication, name: 'Techmax'
    publication2 = create :publication, name: 'Technical'
    book1 = create :book, publication: publication1
    book2 = create :book, publication: publication2
    listing1 = create :listing, book: book1
    listing2 = create :listing, book: book2
    Listing.reindex

    get '/', publication_id: publication1.id
    resp = [listing1.serialized_hash].to_json
    assert last_response.ok?
    assert_equal resp, last_response.body
  end

  def test_index_with_college_filter
    college1 = create :college, name: 'Vishwakarma Institute of Technology'
    college2 = create :college, name: 'Cummins College'
    user1 = create :user, college: college1
    user2 = create :user, college: college2
    listing1 = create :listing, user: user1
    listing2 = create :listing, user: user2
    Listing.reindex

    get '/', college_id: college1.id
    resp = [listing1.serialized_hash].to_json
    assert last_response.ok?
    assert_equal resp, last_response.body
  end

  def test_index_with_department_filter
    department1 = create :department, name: 'Mechanical Engineering'
    department2 = create :department, name: 'Computer Engineering'
    book1 = create :book, department: department1
    book2 = create :book, department: department2
    listing1 = create :listing, book: book1
    listing2 = create :listing, book: book2
    Listing.reindex

    get '/', department_id: department1.id
    resp = [listing1.serialized_hash].to_json
    assert last_response.ok?
    assert_equal resp, last_response.body
  end

  def test_index_with_semester_filter
    semester1 = create :semester, name: 'Mechanical Engineering'
    semester2 = create :semester, name: 'Computer Engineering'
    book1 = create :book, semester: semester1
    book2 = create :book, semester: semester2
    listing1 = create :listing, book: book1
    listing2 = create :listing, book: book2
    Listing.reindex

    get '/', semester_id: semester1.id
    resp = [listing1.serialized_hash].to_json
    assert last_response.ok?
    assert_equal resp, last_response.body
  end

  def test_index_do_not_list_spam
    listing1 = create :listing
    listing2 = create :listing, spam: true

    get '/'
    resp = [listing1.serialized_hash].to_json
    assert last_response.ok?
    assert_equal resp, last_response.body
  end

  def test_index_do_not_list_deleted
    listing1 = create :listing
    listing2 = create :listing, deleted: true

    get '/'
    resp = [listing1.serialized_hash].to_json
    assert last_response.ok?
    assert_equal resp, last_response.body
  end

  def test_index_do_not_list_sold
    listing1 = create :listing
    listing2 = create :listing, sold: true

    get '/'
    resp = [listing1.serialized_hash].to_json
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

    post '/', listing

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

    post '/', listing

    assert last_response.ok?
    assert_equal listing_count + 1, Listing.count
    assert_equal user_count, User.count
  end

  def test_create_when_book_is_present
    book = create :book
    user = create :user
    listing = attributes_for(:listing)
              .merge(book_id: book.id)
              .merge(user_attributes: user.attributes.except("id", "role"))

    listing_count = Listing.count
    book_count = Book.count

    post '/', listing

    assert last_response.ok?
    assert_equal listing_count + 1, Listing.count
    assert_equal book_count, Book.count
  end

  def test_create_when_book_is_not_present
    user = create :user
    listing = attributes_for(:listing)
              .merge(book_attributes: attributes_for(:book).except("id"))
              .merge(user_attributes: user.attributes.except("id", "role"))
    listing_count = Listing.count
    book_count = Book.count

    post '/', listing

    assert last_response.ok?
    assert_equal listing_count + 1, Listing.count
    assert_equal book_count + 1, Book.count
  end

end
