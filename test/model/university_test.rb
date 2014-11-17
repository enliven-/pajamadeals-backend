require_relative '../test_helper.rb'
class UniversityTest < MiniTest::Test

  def test_ubiversity_attributes
    university = University.new

    assert university.respond_to?(:name)
    assert university.respond_to?(:books)
    assert university.respond_to?(:colleges)
  end
end
