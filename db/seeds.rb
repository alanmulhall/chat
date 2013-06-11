#users
User.delete_all

User.create(:first_name => "Kate", :last_name => "Middleton")
User.create(:first_name => "Bob", :last_name => "Dole")
User.create(:first_name => "Alan", :last_name => "Mulhall")

#event types
EventType.delete_all

EventType.create(:name => "Enter the room")
EventType.create(:name => "Leave the room")
EventType.create(:name => "Comment")
EventType.create(:name => "High five another user")

#events
Event.delete_all

event_types = EventType.all
users = User.all
Event.create(:event_type_id => event_types.first.id, :user_id => users[1].id,
             :chat_room_id => 1)
Event.create(:event_type_id => event_types.first.id, :user_id => users.first.id,
             :chat_room_id => 1)
Event.create(:event_type_id => event_types[2].id, :user_id => users[1].id,
             :chat_room_id => 1)
Event.create(:event_type_id => event_types[3].id, :user_id => users[1].id,
             :chat_room_id => 1)
Event.create(:event_type_id => event_types[1].id, :user_id => users[1].id,
             :chat_room_id => 1)
Event.create(:event_type_id => event_types[3].id, :user_id => users.first.id,
             :chat_room_id => 1)
Event.create(:event_type_id => event_types[2].id, :user_id => users.first.id,
             :chat_room_id => 1)

Event.create(:event_type_id => event_types.first.id, :user_id => users[1].id,
             :chat_room_id => 1, :created_at => (Time.zone.now - 1.hour),
             :updated_at => (Time.zone.now - 1.hour))
Event.create(:event_type_id => event_types.first.id, :user_id => users.first.id,
             :chat_room_id => 1, :created_at => (Time.zone.now - 1.hour),
             :updated_at => (Time.zone.now - 1.hour))
Event.create(:event_type_id => event_types[2].id, :user_id => users[1].id,
             :chat_room_id => 1, :created_at => (Time.zone.now - 1.hour),
             :updated_at => (Time.zone.now - 1.hour))
Event.create(:event_type_id => event_types[3].id, :user_id => users[1].id,
             :chat_room_id => 1, :created_at => (Time.zone.now - 1.hour),
             :updated_at => (Time.zone.now - 1.hour))
Event.create(:event_type_id => event_types[1].id, :user_id => users[1].id,
             :chat_room_id => 1, :created_at => (Time.zone.now - 1.hour),
             :updated_at => (Time.zone.now - 1.hour))
Event.create(:event_type_id => event_types[3].id, :user_id => users.first.id,
             :chat_room_id => 1, :created_at => (Time.zone.now - 1.hour),
             :updated_at => (Time.zone.now - 1.hour))
Event.create(:event_type_id => event_types[2].id, :user_id => users.first.id,
             :chat_room_id => 1, :created_at => (Time.zone.now - 1.hour),
             :updated_at => (Time.zone.now - 1.hour))
#messages
Message.delete_all
events_with_message = Event.where(:event_type_id => event_types[2].id)

Message.create(:content => 'Hey, Kate - high five?' , :user_id => users[1].id,
               :event_id => events_with_message.first.id)
Message.create(:content => 'Oh, typical' , :user_id => users.first.id,
               :event_id => events_with_message[1].id)
Message.create(:content => 'Hey, Kate - high five again?' , :user_id => users[1].id,
               :event_id => events_with_message[2].id)
Message.create(:content => 'Oh, typical again' , :user_id => users.first.id,
               :event_id => events_with_message[3].id)
