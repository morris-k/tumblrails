class AddReblogKeyToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :reblog_key, :string
  end
end
