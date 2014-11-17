require_relative '../test_helper.rb'

class DepartmentTest < MiniTest::Test

  def test_department_attributes
    department = Department.new

    assert department.respond_to?(:name)
    assert department.respond_to?(:abbr)
    assert department.respond_to?(:books)
  end
end
