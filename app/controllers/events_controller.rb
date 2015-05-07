class EventsController < ApplicationController

	def index
  	@event_categories = EventCategory.all
  	@events = Event.search(params[:event_keyword])
	end 

  def show
   	@event_categories = EventCategory.all
  	@events = EventCategory.find(params[:event_category_id]).events
  	@event =  @events.find(params[:id])
  end
end
