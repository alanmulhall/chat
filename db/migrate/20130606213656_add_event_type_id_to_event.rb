class AddEventTypeIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :chat_room_id, :integer
    add_column :events, :event_id, :integer
    remove_column :events, :name
  end
end
