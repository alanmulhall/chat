class Event < ActiveRecord::Base

  attr_accessible :event_type_id, :chat_room_id, :user_id, :created_at,
                  :updated_at

  belongs_to :event_type
  belongs_to :user
  has_many :messages

  class << self

    def get(options)
      if options[:display] != 'all' && self.is_safe?(options[:display])
        events = Event.where('created_at >= ?', Time.zone.now.beginning_of_day - 30.day)
        events = events.includes(:event_type).order('created_at DESC')
          .group_by{|r| r.created_at.hour}
        self.count_events events
      else
        all
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

    def is_safe?(display_type)
      %w(hour).include? display_type.downcase
    end

  end

end
