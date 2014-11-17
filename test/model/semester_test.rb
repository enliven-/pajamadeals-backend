require_relative '../test_helper'

class SemesterTest < MiniTest::Test

  def test_semester_attribute
    semester = Semester.new

    assert semester.respond_to?(:name)
    assert semester.respond_to?(:books)
  end
end
