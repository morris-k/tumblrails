class AddIsReblogToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :is_reblog, :boolean, default: false
  end
end
