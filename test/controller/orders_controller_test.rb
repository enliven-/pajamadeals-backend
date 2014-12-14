require_relative '../test_helper'

class OrdersControllerTest < MiniTest::Test

  def app
    OrdersController
  end

  # test create
  def test_create
    order = build(:order).attributes.except("id", "created_at", "updated_at",
                                           "seller_id", "status")
      .merge(buyer_attributes: build(:ankush).attributes.except("id"))
    order_count = Order.count

    post_json '/', order

    assert last_response.ok?
    assert_equal order_count + 1, Order.count
    assert_equal Order.last.serialized_hash.to_json, last_response.body
    assert_equal "order placed", Order.last.status
  end

  # test delete / cancel order
  def test_update_status_cancelled
    order = create :order

    assert_equal "order placed", order.status

    put_json '/', { id: order.id, status: "cancelled" }

    assert last_response.ok?
    assert last_response.ok?
    refute_equal last_response.body, order.serialized_hash.to_json

    order.reload

    assert_equal "cancelled", order.status
    assert_equal order.serialized_hash.to_json, last_response.body
  end

  # test index
  def test_index_for_buy_orders
    user1 = create :user, mobile: '9988776655'
    user2 = create :user, mobile: '9988776644'
    listing1 = create :listing, user: user1
    listing2 = create :listing, user: user2
    order1 = create :order, listing: listing1, buyer: user2
    order2 = create :order, listing: listing2, buyer: user1

    get '/', mobile: user1.mobile, type: 'buy_orders'

    assert last_response.ok?
    assert_match [order2.serialized_hash].to_json, last_response.body
  end
  
  # test index when user does not exist returns empty array
  def test_index_when_user_does_not_exist
    order = create :order
    
    get '/', mobile: '12345', type: 'buy_orders'
    
    assert last_response.ok?
    assert_match [].to_json, last_response.body
  end
  
  # test index returns an empty array when orders doesn't exist for a user
  def test_index_returns_empty_array_for_no_orders
    order = create :order
    buyer_mobile = order.buyer.mobile
    
    order.destroy
    
    get '/', mobile: buyer_mobile, type: 'buy_orders'
    
    assert last_response.ok?
    assert_match [].to_json, last_response.body
  end
  
  # test index returns buy orders of type not given
  def test_index_returns_buy_orders_if_type_not_given
    order = create :order
    buyer_mobile = order.buyer.mobile
    
    get '/', mobile: buyer_mobile
    
    assert last_response.ok?
    assert [order.serialized_hash].to_json, last_response.body
  end

  # test show
  def test_show_order
    order = create :order

    get "/#{order.id}"

    assert last_response.ok?
    assert order.serialized_hash.to_json, last_response.body
  end
end
