class CreateAcademicYears < ActiveRecord::Migration
  def change
    create_table :academic_years do |t|
      t.string :name
      t.string :abbr

      t.timestamps
    end
  end
end
