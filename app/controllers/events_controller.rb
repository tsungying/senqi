class EventsController < ApplicationController
  def show
   	@event_categories = EventCategory.all
  	@events = EventCategory.find(params[:event_category_id]).events
  	@event =  @events.find(params[:id])
  end
end
