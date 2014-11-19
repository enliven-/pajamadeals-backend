require_relative '../test_helper'

class CourseTest < MiniTest::Test

  def test_course_attributes
    course = Course.new

    assert course.respond_to?(:title)
    assert course.respond_to?(:abbr)
  end

  def test_course_relations
    course = Course.new

    assert course.respond_to?(:departments)
    assert course.respond_to?(:semesters)
    assert course.respond_to?(:books)
  end
end
