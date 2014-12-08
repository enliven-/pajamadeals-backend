require_relative '../test_helper'
class UserTest < MiniTest::Test
  def app
    UsersController
  end

  def test_user_attributes
    user = User.new

    assert user.respond_to?(:name)
    assert user.respond_to?(:mobile)
    assert user.respond_to?(:role)
    assert user.respond_to?(:email)
  end

  def test_user_relations
    user = User.new

    assert user.respond_to?(:college)
    assert user.respond_to?(:listings)
    assert user.respond_to?(:sell_orders)
    assert user.respond_to?(:buy_orders)
    assert user.respond_to?(:department)
    assert user.respond_to?(:semester)
  end

  # validations

  def test_presence_of_name
    user = build(:user)
    user.name = nil

    assert !user.valid?
    assert !user.save
    assert !user.errors.empty?
  end

  def test_presence_of_mobile
    user = build(:user)
    user.mobile = nil

    assert !user.valid?
    assert !user.save
    assert !user.errors.empty?
  end

  def test_presence_of_college
    user = build(:user)
    user.college = nil

    assert !user.valid?
    assert !user.save
    assert !user.errors.empty?
  end
end
