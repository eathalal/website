class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :permalink
      t.text :description

      t.timestamps
    end

    add_index :categories, :permalink, unique: true
  end
end
