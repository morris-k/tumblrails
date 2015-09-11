class CreateBlogFollows < ActiveRecord::Migration
  def change
    create_table :blog_follows do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps null: false
    end
    add_index :blog_follows, :follower_id
    add_index :blog_follows, :followed_id
    add_index :blog_follows, [:follower_id, :followed_id], unique: true
  end
end
