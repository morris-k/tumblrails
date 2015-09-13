class AddCaptionToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :caption, :text
    add_index :posts, [:post_type, :caption]
  end
end
