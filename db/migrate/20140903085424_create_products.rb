class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :network_id
      t.decimal :price, precision: 7, scale: 2

      t.timestamps
    end
  end
end
