class CreateBooksSemesters < ActiveRecord::Migration
  def change
    create_table :books_semesters do |t|
      t.integer :book_id
      t.integer :semester_id

      t.timestamps
    end
  end
end
