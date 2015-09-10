class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :name
      t.string :title, default: "My Blog"
      t.boolean :primary
      t.boolean :admin
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :blogs, :user_id
    add_index :blogs, :name, unique: true
  end
end
