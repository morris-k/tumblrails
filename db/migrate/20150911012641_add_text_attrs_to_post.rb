class AddTextAttrsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :title, :string
    add_column :posts, :body, :text
    add_index :posts, [:post_type, :title, :body]
  end
end
