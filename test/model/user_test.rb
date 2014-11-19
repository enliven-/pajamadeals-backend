require_relative '../test_helper'
class UserTest < MiniTest::Test
  def app
    UsersController
  end

  def test_user_attributes
    user = User.new

    assert user.respond_to?(:name)
    assert user.respond_to?(:mobile_number)
    assert user.respond_to?(:role)
    assert user.respond_to?(:department)
    assert user.respond_to?(:semester)
  end

  def test_user_relations
    user = User.new

    assert user.respond_to?(:college)
    assert user.respond_to?(:listings)
  end

  # validations

  def test_presence_of_name
    user = build(:user)
    user.name = nil

    assert !user.valid?
    assert !user.save
    assert !user.errors.empty?
  end

  def test_presence_of_mobile_number
    user = build(:user)
    user.mobile_number = nil

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
