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
    assert order.respond_to?(:college)
    assert order.respond_to?(:seller)
    assert order.respond_to?(:buyer)
    assert order.respond_to?(:handler)
  end

  def test_create_order_with_default_values
    order = create :order

    assert order.status.present?
    assert_equal "created", order.status
    assert order.college.present?
  end
end
