class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :permalink
      t.text :content

      t.timestamps
    end

    add_index :posts, :permalink, unique: true
  end
end
