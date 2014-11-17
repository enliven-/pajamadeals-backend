class CreateBooksColleges < ActiveRecord::Migration
  def change
    create_table :books_colleges do |t|
      t.integer :book_id
      t.integer :college_id

      t.timestamps
    end
  end
end
