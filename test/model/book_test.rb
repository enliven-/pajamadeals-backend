require_relative '../test_helper.rb'

class BookTest < MiniTest::Test

  def test_book_sttributes
    book = Book.new

    assert book.respond_to?(:title)
    assert book.respond_to?(:authors)
    assert book.respond_to?(:images)
    assert book.respond_to?(:universities)
    assert book.respond_to?(:colleges)
    assert book.respond_to?(:departments)
    assert book.respond_to?(:academic_years)
    assert book.respond_to?(:semesters)
  end
end
