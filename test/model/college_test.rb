require_relative '../test_helper.rb'

class CollegeTest < MiniTest::Test

  def test_college_sttributes
    college = College.new

    assert college.respond_to?(:name)
    assert college.respond_to?(:zipcode)
    assert college.respond_to?(:abbr)
    assert college.respond_to?(:city)
    assert college.respond_to?(:latitude)
    assert college.respond_to?(:longitude)
    assert college.respond_to?(:university)
    assert college.respond_to?(:books)
  end
end
