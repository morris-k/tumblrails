class AddReblogInfoToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :is_reblog, :boolean, default: false
    add_column :posts, :reblogged_id, :integer
    add_column :posts, :original_id, :integer
    add_index :posts, [:reblogged_id, :original_id]
  end
end
