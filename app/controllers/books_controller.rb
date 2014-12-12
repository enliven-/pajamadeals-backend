require_relative 'application_controller'
class BooksController < ApplicationController

  get '/' do
    params[:q] ||= '*'
    books = Book.search(params[:q], fields: [:title]).results

    books.collect! { |book| book.serialized_hash }

    json books
  end
end
