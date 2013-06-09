#http://stackoverflow.com/questions/3491650/is-it-possible-to-group-by-hour-minute-quarter-hour-directly-in-activerecord-rai
#http://stackoverflow.com/questions/449271/how-to-round-a-time-down-to-the-nearest-15-minutes-in-ruby
class EventsController < ApplicationController
  def index
    @type = params[:display] ||= 'test'
    @events = Event.get :type => @type
  end
end
