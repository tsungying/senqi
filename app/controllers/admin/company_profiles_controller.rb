class Admin::CompanyProfilesController < Admin::BaseController

  def index
  	@company_profiles = CompanyProfile.all
  end

  def show

  end

  def new
		@company_profile = CompanyProfile.new
  end

  def create
  	@company_profile = CompanyProfile.new(company_profile_params)
  	
  	if @company_profile.save
  		redirect_to admin_company_profiles_url
  	else
  		render :new
  	end

  end

  def edit
  	
  end

  def update

  end

  def destroy

  end

  private

  	def company_profile_params
  		params.require(:company_profile).permit(:office_image, :brand_story, :play_order)
  	end

end
