class EventCategoriesController < ApplicationController

  def index
  	@event_categories = EventCategory.all
  	@events = Event.order("publish_at desc").all
  end

  def show
  	@event_categories = EventCategory.all
  	@events = EventCategory.find(params[:id]).events.order("publish_at desc")
  end
end
