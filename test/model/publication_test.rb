require_relative '../test_helper'

class PublicationTest < MiniTest::Test

  def test_publication_attributes
    publication = Publication.new

    assert publication.respond_to?(:name)
  end

  def test_publication_relation
    publication = Publication.new

    assert publication.respond_to?(:books)
  end
end
