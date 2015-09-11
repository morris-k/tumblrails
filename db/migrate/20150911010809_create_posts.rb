class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :blog_id

      t.timestamps null: false
    end
    add_index :posts, :blog_id
  end
end
