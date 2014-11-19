require_relative '../test_helper'

class SemesterTest < MiniTest::Test

  def test_semester_attribute
    semester = Semester.new

    assert semester.respond_to?(:name)
  end

  def test_semester_relations
    semester = Semester.new

    assert semester.respond_to?(:courses)
    assert semester.respond_to?(:subjects)
    assert semester.respond_to?(:books)
  end
end
