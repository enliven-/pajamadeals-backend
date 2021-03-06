require_relative '../test_helper'

class OrderTest < MiniTest::Test

  def test_order_attributes
    order = Order.new

    assert order.respond_to?(:status)
    assert order.respond_to?(:created_at)
    assert order.respond_to?(:updated_at)
  end

  def test_order_associations
    order = Order.new

    assert order.respond_to?(:listing)
    assert order.respond_to?(:seller)
    assert order.respond_to?(:seller_college)
    assert order.respond_to?(:buyer)
    assert order.respond_to?(:buyer_college)
    assert order.respond_to?(:handler)
  end

  def test_create_order_with_default_values
    order = create :order

    assert order.status.present?
    assert_equal "order placed", order.status
    assert order.seller_college.present?
    assert order.buyer_college.present?
    assert order.seller.present?
    assert_equal order.listing.user, order.seller
  end

  def test_mark_listing_sold_on_placeing_order
    listing = create :listing

    refute listing.sold?

    order = create :order, listing: listing

    assert listing.sold?
  end

  def test_mark_listing_unsold_on_cancelling_order
    listing = create :listing
    order = create :order, listing: listing

    assert listing.sold?

    order.cancelled!
    refute listing.sold?
  end

  def test_set_seller_and_buyer_college_for_orders
    seller_college = create :college, name: 'foo'
    buyer_college = create :college, name: 'bar'
    seller = create :user, mobile: '9975454384', college: seller_college
    buyer = create :user, mobile: '9975454382', college: buyer_college
    listing = create :listing, user: seller

    order = create :order, listing: listing, buyer: buyer

    assert order.valid?
    assert_equal listing, order.listing
    assert_equal seller,  order.seller
    assert_equal seller_college, order.seller_college
    assert_equal buyer_college,  order.buyer_college
  end
  
  def test_send_notification_to_buyer
    order = build :order
    order.expects(:send_notification_to_buyer).returns("sent")
    order.save
  end
  
  def test_send_notification_to_seller
    order = build :order
    order.expects(:send_notification_to_seller).returns("sent")
    order.save
  end
end
