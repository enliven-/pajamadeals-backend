require_relative '../test_helper'
class ListingsControllerTest < MiniTest::Test
  def app
    ListingsController
  end

  # test index

  def test_index
    listing1 = create :listing, title: 'Foo listing'
    listing2 = create :listing, title: 'Bar listing'

    resp = [listing1.serialized_hash, listing2.serialized_hash].as_json
    get '/index'

    assert last_response.ok?
    assert_equal resp, last_response.body
  end
end
