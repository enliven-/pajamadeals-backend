class BooksController < ApplicationController

  get '/' do
    books = Book.all

    books.collect! { |book| book.serialized_hash }

    json books
  end
end
