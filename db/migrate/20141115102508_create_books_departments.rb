class CreateBooksDepartments < ActiveRecord::Migration
  def change
    create_table :books_departments do |t|
      t.integer :book_id
      t.integer :department_id

      t.timestamps
    end
  end
end
