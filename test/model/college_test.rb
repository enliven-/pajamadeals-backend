require_relative '../test_helper.rb'

class CollegeTest < MiniTest::Test

  def test_college_attributes
    college = College.new

    assert college.respond_to?(:name)
    assert college.respond_to?(:zipcode)
    assert college.respond_to?(:abbr)
    assert college.respond_to?(:city)
    assert college.respond_to?(:latitude)
    assert college.respond_to?(:longitude)
  end

  def test_college_relations
    college = College.new

    assert college.respond_to?(:university)
    assert college.respond_to?(:departments)
    assert college.respond_to?(:books)
    assert college.respond_to?(:sell_orders)
    assert college.respond_to?(:buy_orders)
    assert college.respond_to?(:users)
  end

  def test_geolocation_works
    college1 = create :college, latitude: '18.511766', longitude: '73.819759'
    college2 = create :college, latitude: '18.519206', longitude: '73.814940'
    college3 = create :college, latitude: '18.520467', longitude: '73.856716'
    College.reindex

    assert_includes college1.nearest_colleges, college1
    assert_includes college1.nearest_colleges, college2
    refute_includes college1.nearest_colleges, college3
  end
end
