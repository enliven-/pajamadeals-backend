class CreateDepeartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.string :abbr


      t.timestamps
    end
  end
end
