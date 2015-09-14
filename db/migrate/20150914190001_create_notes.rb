class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :notable_id
      t.string :notable_type
      t.string :reblog_key

      t.timestamps null: false
    end
    add_index :notes, :reblog_key
    add_index :notes, [:reblog_key, :notable_id, :notable_type]
  end
end
