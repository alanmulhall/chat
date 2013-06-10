class EventsController < ApplicationController

  def index
    @display_type = params[:display] ||= 'all'
    if @display_type == 'all'
      @events = Event.all
    else
      events = Event.get :display => @display_type
      @events = Event.count_events events
    end
  end

end
