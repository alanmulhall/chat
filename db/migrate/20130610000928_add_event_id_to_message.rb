class AddEventIdToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :event_id, :integer
  end
end
