class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :mobile_number
      t.integer :college_id
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
