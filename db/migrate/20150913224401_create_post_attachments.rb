class CreatePostAttachments < ActiveRecord::Migration
  def change
    create_table :post_attachments do |t|
      t.integer :post_id
      t.string :attachment

      t.timestamps null: false
    end
    add_index :post_attachments, :post_id
    add_index :post_attachments, [:post_id, :attachment]
  end
end
