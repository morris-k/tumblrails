class AddTypeColumnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :post_type, :string, polymorphic: true
  end
end
