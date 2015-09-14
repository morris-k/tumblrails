class AddAvatarToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :avatar, :string
    add_index :blogs, :avatar
  end
end
