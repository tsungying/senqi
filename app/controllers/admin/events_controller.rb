class Admin::EventsController < Admin::BaseController

  def index
  end

  def show
    @event_category = EventCategory.find(params[:event_category_id])
    @event = @event_category.events.find(params[:id])
    @url = event_category_event_url(@event_category, @event)    
  end

  def new
  	@event_category = EventCategory.find(params[:event_category_id])
  	@event = @event_category.events.new
  end

  def create
   	@event_category = EventCategory.find(params[:event_category_id])
  	@event = @event_category.events.new(event_params)
  	if @event.save
  		redirect_to [:admin, @event_category, @event]
  	else
  		render :new
  	end
  end

  def edit
   	@event_category = EventCategory.find(params[:event_category_id])
  	@event = @event_category.events.find(params[:id])
  end

  def update
  	@event_category = EventCategory.find(params[:event_category_id])
  	@event = @event_category.events.find(params[:id])
   	if @event.update_attributes(event_params)
  		redirect_to admin_event_category_url(@event.event_category)
  	else
  		render :edit
  	end 
  end

  def destroy
  	@event_category = EventCategory.find(params[:event_category_id])
  	@event = @event_category.events.find(params[:id])
  	@event.destroy
  	redirect_to [:admin, @event_category]
  end

  private

  	def event_params
  		params.require(:event).permit(:title, :event_image, :home_image, :content, :summary, :publish_at)
  	end

end
