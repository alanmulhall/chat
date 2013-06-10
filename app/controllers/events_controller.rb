#http://stackoverflow.com/questions/10484621/how-can-i-group-on-the-created-at-field-and-return-only-the-date-and-hour
class EventsController < ApplicationController

  def index
    @display_type = params[:display] ||= 'all'
    if @display_type == 'all'
      @events = Event.all
    else
      @events = Event.get :display => @display_type
    end
  end

end
