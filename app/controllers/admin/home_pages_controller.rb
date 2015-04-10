class Admin::HomePagesController < Admin::BaseController

  def index
  	@home_logo = HomePage.where( slider:  nil ).order("play_order desc")
  	@home_slider = HomePage.where( logo: nil ).order("play_order desc")	
  end

  def show
  	@home = HomePage.find(params[:id])
  end

  def new
  	@home = HomePage.new
  end

  def create
  	@home = HomePage.new(home_page_params)
  	if @home.save
  		redirect_to admin_home_pages_url
  	else
  		render :new
  	end
  end

  def edit
		@home = HomePage.find(params[:id])
  end

  def update
		@home = HomePage.find(params[:id])
		if @home.update_attributes(home_page_params)
			redirect_to admin_home_pages_url
		else
			render :edit
		end
  end

  def destroy
		@home = HomePage.find(params[:id])
		@home.destroy
		redirect_to admin_home_pages_url
  end
  
  private

  	def home_page_params
  		params.require(:home_page).permit(:logo, :slider, :play_order)
  	end
end
