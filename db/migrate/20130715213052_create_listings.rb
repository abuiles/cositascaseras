class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.references :store

      t.timestamps
    end
  end
end
