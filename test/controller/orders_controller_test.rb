require_relative '../test_helper'

class OrdersControllerTest < MiniTest::Test

  def app
    OrdersController
  end

  # test create
  def test_create
    order = build(:order)
    order_count = Order.count

    post '/create', order: order

    assert last_response.ok?
    assert order_count + 1, Order.count
  end
end
