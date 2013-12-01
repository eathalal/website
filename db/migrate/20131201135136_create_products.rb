class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :permalink
      t.text :description
      t.decimal :price, precision: 8, scale: 2, default: 0.00
      t.integer  :category_id

      t.timestamps
    end

    add_index :products, :category_id
    add_index :products, :permalink, unique: true
  end
end
