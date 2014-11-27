require_relative '../test_helper'

class OrdersControllerTest < MiniTest::Test

  def app
    OrdersController
  end

  # test create
  def test_create
    order = build(:order).attributes.except("id", "created_at", "updated_at",
                                           "seller_id")
      .merge(buyer_attributes: build(:ankush).attributes.except("id"))
    order_count = Order.count

    post '/', order

    assert last_response.ok?
    assert order_count + 1, Order.count
  end
end
