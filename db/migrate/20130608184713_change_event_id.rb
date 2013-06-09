class ChangeEventId < ActiveRecord::Migration
  def up
    rename_column :events, :event_id, :event_type_id
  end

  def down
    rename_column :events, :event_type_id, :event_id
  end
end
