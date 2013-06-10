module EventsHelper

  def display_event(event)
    if event.event_type.name == 'Comment' && event.messages.present?
      "comments: \"#{event.messages[0].content}\""
    else
      event.event_type.name
    end
  end
end