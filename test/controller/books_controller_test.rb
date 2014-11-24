require_relative '../test_helper'

class BooksControllerTest < MiniTest::Test
  def app
    BooksController
  end

  # test index

  def test_index
    book1 = create :book, title: 'book 1'
    book2 = create :book, title: 'book 2'

    response = [book1.serialized_hash, book2.serialized_hash].to_json

    get '/'

    assert last_response.ok?
    assert_equal response, last_response.body
  end
end
