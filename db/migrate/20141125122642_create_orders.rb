class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :status, default: 0
      t.references :listing
      t.references :college
      t.references :seller
      t.references :buyer
      t.references :handler

      t.timestamps
    end
  end
end
