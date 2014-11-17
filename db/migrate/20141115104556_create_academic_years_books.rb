class CreateAcademicYearsBooks < ActiveRecord::Migration
  def change
    create_table :academic_years_books do |t|
      t.integer :academic_year_id
      t.integer :book_id

      t.timestamps
    end
  end
end
