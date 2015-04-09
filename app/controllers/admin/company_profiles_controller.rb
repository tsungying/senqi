class Admin::CompanyProfilesController < Admin::BaseController

  def index
  	@about_office = CompanyProfile.where( brand_story:  nil ).order("play_order desc")
  	@about_brand_story = CompanyProfile.where( office_image: nil ).order("play_order desc")	
  end

  def show
		@company_profile = CompanyProfile.find(params[:id])
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
  	@company_profile = CompanyProfile.find(params[:id])  	
  end

  def update
  	@company_profile = CompanyProfile.find(params[:id])
  	
  	if @company_profile.update_attributes(company_profile_params)
  		redirect_to admin_company_profiles_url
  	else
  		render :edit
  	end
  end

  def destroy
		@company_profile = CompanyProfile.find(params[:id])
		@company_profile.destroy
		redirect_to admin_company_profiles_url
  end

  private

  	def company_profile_params
  		params.require(:company_profile).permit(:office_image, :brand_story, :play_order)
  	end

end
