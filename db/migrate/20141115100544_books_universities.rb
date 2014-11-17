class BooksUniversities < ActiveRecord::Migration
  def change
    create_table :books_universities do |t|
      t.integer :university_id
      t.integer :book_id

      t.timestamps
    end
  end
end
