class Event < ActiveRecord::Base

  attr_accessible :event_type_id, :chat_room_id, :user_id, :created_at,
                  :updated_at

  belongs_to :event_type
  belongs_to :user

  class << self

    def get(options)
      events = Event.where('created_at >= ?', Time.zone.now.beginning_of_day - 7.day)
      unless options[:display] == 'all'
        events.includes(:event_type).order('created_at DESC')
          .group_by{|r| r.created_at.hour}
        #TODO call count_events here...
      end
    end

    def count_events(events)
      counted = {}
      time = ""
      events.each do |event|
        if time != event.first.to_s
          counted[event.first.to_s] = self.count_event_types(event.last)
          time = event.first.to_s
        end
      end

      counted
    end

    def count_event_types(events)
      event_types = events.map{ |event_types| event_types.event_type }.uniq
      counted = {}
      event_types.each do |event_type|
        counted[event_type.name] =
            events.select{ |event| event.event_type_id == event_type.id }.size
      end

      counted
    end
  end

end
