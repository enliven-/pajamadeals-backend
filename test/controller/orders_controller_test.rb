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

  # test index
  # def test_index
  #   user1 = create :user, mobile: '9988776655'
  #   user2 = create :user, mobile: '9988776644'
  #   user3 = create :user, mobile: '9988776633'
  #   listing1 = create :listing, user: user1
  #   listing2 = create :listing, user: user2
  #   listing3 = create :listing, user: user3
  #   order1 = create :order, listing: listing1, buyer: user2
  #   order2 = create :order, listing: listing2, buyer: user1

  #   get '/', mobile: user1.mobile

  #   assert last_response.ok?
  #   assert_match order1.serialized_hash.to_json, last_response.body
  # end

end
