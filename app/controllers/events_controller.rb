class EventsController < ApplicationController

  def index
    @display_type = params[:display] ||= 'all'
    @events = Event.get :display => @display_type
  end

end
