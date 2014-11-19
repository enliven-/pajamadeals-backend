require_relative '../test_helper.rb'

class DepartmentTest < MiniTest::Test

  def test_department_attributes
    department = Department.new

    assert department.respond_to?(:name)
    assert department.respond_to?(:abbr)
  end

  def test_department_relations
    department = Department.new

    assert department.respond_to?(:courses)
    assert department.respond_to?(:colleges)
    assert department.respond_to?(:books)
    assert department.respond_to?(:users)
  end
end
