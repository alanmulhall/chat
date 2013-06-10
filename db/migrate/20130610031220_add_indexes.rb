class AddIndexes < ActiveRecord::Migration
  def up
    add_index :events, :created_at
    add_index :events, :chat_room_id
    add_index :events, :event_type_id
    add_index :events, :user_id
    add_index :messages, :user_id
    add_index :messages, :event_id
  end

  def down
    remove_index :events, :created_at
    remove_index :events, :chat_room_id
    remove_index :events, :event_type_id
    remove_index :events, :user_id
    remove_index :messages, :user_id
    remove_index :messages, :event_id
  end
end
