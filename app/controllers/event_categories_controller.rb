class EventCategoriesController < ApplicationController

  def index
  	@event_categories = EventCategory.all
  	@events = Event.order("id desc").all
  end

  def show
  	@event_categories = EventCategory.all
  	@events = EventCategory.find(params[:id]).events.order("id desc")
  end
end
