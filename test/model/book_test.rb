require_relative '../test_helper.rb'

class BookTest < MiniTest::Test

  def test_book_sttributes
    book = Book.new

    assert book.respond_to?(:title)
    assert book.respond_to?(:authors)
    assert book.respond_to?(:mrp)
    assert book.respond_to?(:book_type)
  end

  def test_book_relations
    book = Book.new

    assert book.respond_to?(:images)
    assert book.respond_to?(:university)
    assert book.respond_to?(:college)
    assert book.respond_to?(:department)
    assert book.respond_to?(:course)
    assert book.respond_to?(:semester)
    assert book.respond_to?(:subject)
    assert book.respond_to?(:publication)
    assert book.respond_to?(:listings)
  end
end
