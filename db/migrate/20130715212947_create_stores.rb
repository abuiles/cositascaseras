class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.references :user

      t.timestamps
    end
  end
end
