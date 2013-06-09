#http://stackoverflow.com/questions/2919720/how-to-get-record-created-today-by-rails-activerecord
#
#http://stackoverflow.com/questions/5419148/rails-get-beginning-of-day-in-time-zone
#
#
#
# group("DATE_PART('hour', created_at)").count
#
#http://stackoverflow.com/questions/3491650/is-it-possible-to-group-by-hour-minute-quarter-hour-directly-in-activerecord-rai
#http://stackoverflow.com/questions/449271/how-to-round-a-time-down-to-the-nearest-15-minutes-in-ruby
class EventsController < ApplicationController
  def index
    #@event_counts = Event.where(
    #  "DATE_PART('hour', created_at) = ?", 1).group('event_id').count
    #@event_counts = Event.group("DATE_PART('hour', created_at)").count
    @type = params[:type] ||= 'test'
    @events = Event.get :type => @type
    #@event_types = EventType.all
  end
end
