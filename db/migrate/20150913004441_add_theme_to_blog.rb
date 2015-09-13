class AddThemeToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :theme, :string
  end
end
