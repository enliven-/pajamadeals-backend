require_relative '../test_helper'

class BooksControllerTest < MiniTest::Test
  def app
    BooksController
  end

  # test index

  def test_index_with_no_query
    book1 = create :book, title: 'book 1'
    book2 = create :book, title: 'book 2'
    Book.reindex

    response = [book1.serialized_hash, book2.serialized_hash].to_json

    get '/'

    assert last_response.ok?
    assert_equal response, last_response.body
  end

  def test_index_with_query
    book1 = create :book, title: 'book 1'
    book2 = create :book, title: 'book 2'
    book3 = create :book, title: 'foo bar'
    Book.reindex

    get '/', q: 'book'
    response = [book1.serialized_hash, book2.serialized_hash].to_json
    assert last_response.ok?
    assert_equal response, last_response.body
  end
end
