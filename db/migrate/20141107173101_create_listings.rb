class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string  :title
      t.text    :description
      t.string  :price
      t.string  :image
      t.integer :quality
      t.integer :markings
      t.string  :edition
      t.boolean :torn, default: false
      t.boolean :spam, default: false
      t.boolean :deleted, default: false
      t.boolean :sold, default: false
      t.integer :user_id
      t.integer :college_id

      t.timestamps
    end
  end
end
