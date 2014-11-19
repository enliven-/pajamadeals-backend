require_relative '../test_helper'

class SubjectTest < MiniTest::Test

  def test_subject_attributes
    subject = Subject.new

    assert subject.respond_to?(:name)
    assert subject.respond_to?(:abbr)
  end

  def test_subject_relations
    subject = Subject.new

    assert subject.respond_to?(:semesters)
    assert subject.respond_to?(:books)
  end
end
