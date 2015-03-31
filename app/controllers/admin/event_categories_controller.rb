class Admin::EventCategoriesController < Admin::BaseController

  def index
  	@categories = EventCategory.all
  end

  def show
  	@event_category = EventCategory.find(params[:id])
  	@events = @event_category.events
  end

  def new
  	@event_category = EventCategory.new
  end

  def create
  	@event_category = EventCategory.new(event_category_params)
  	if @event_category.save
  		redirect_to admin_event_categories_url
  	else
  		render :new
  	end
  end

  def edit
  	@event_category = EventCategory.find(params[:id])
  end

  def update
  	@event_category = EventCategory.find(params[:id])
  	if @event_category.update_attributes(event_category_params)
  		redirect_to admin_event_categories_url
  	else
  		render :edit
  	end
  end

  private

  	def event_category_params
  		params.require(:event_category).permit(:name)
  	end
end
