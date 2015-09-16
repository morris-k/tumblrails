class CreateReblogs < ActiveRecord::Migration
  def change
    create_table :reblogs do |t|
      t.integer :post_id
      t.integer :reblogged_post_id
      t.string :reblog_key
      t.integer :reblogger_id
      t.integer :reblogged_id
      t.text :comment

      t.timestamps null: false
    end
    add_index :reblogs, :reblog_key
    add_index :reblogs, [:post_id, :reblog_key]
    add_index :reblogs, [:reblog_key, :reblogger_id, :reblogged_id]
  end
end
