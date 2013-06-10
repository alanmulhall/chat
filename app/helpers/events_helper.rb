module EventsHelper

  def display_event(event)
    if event.event_type.name == 'Comment' && event.messages.present?
      "comments: \"#{event.messages[0].content}\""
    else
      event.event_type.name
    end
  end

  def get_time(time)
    times = { '0' => '12:00AM', '1' => '01:00AM', '2' => '02:00AM', '3' => '03:00AM',
      '4' => '04:00AM', '5' => '05:00AM', '6' => '06:00AM', '7' => '07:00AM',
      '8' => '08:00AM', '9' => '09:00AM', '10' => '10:00AM', '11' => '11:AM',
      '12' => '12:00PM', '13' => '01:00PM', '14' => '02:00PM', '15' => '3:00PM',
      '16' => '04:00PM', '17' => '05:00PM', '18' => '06:00PM', '19' => '07:00PM',
      '20' => '08:00PM', '21' => '09:00PM', '22' => '10:00PM', '23' => '11:00PM',
      '24' => '12:00AM'}
    times[time.to_s]
  end
end