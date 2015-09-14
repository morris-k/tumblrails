class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :reblog_key
      t.integer :post_id
      t.integer :liker_id
      t.integer :liked_id

      t.timestamps null: false
    end
    add_index :likes, :reblog_key
  end
end
