require_relative '../test_helper.rb'

class AcademicYearTest < MiniTest::Test

  def test_academic_year_attributes
    academic_year = AcademicYear.new

    assert academic_year.respond_to?(:name)
    assert academic_year.respond_to?(:abbr)
    assert academic_year.respond_to?(:books)
  end
end
