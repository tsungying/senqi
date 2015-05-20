class Admin::TermsOfServicesController < Admin::BaseController
  def index
    @service = TermsOfService.first
  end

  def new
  	@service = TermsOfService.new
  end

  def create
  	@service = TermsOfService.new(terms_of_service_params)
  	if @service.save
  		redirect_to admin_terms_of_services_url
  	else
  		render :new
  	end
  end

  def edit
  	@service = TermsOfService.find(params[:id])
  end

  def update
  	@service = TermsOfService.find(params[:id])
   	if @service.update_attributes(terms_of_service_params)
  		redirect_to admin_terms_of_services_url
  	else
  		render :edit
  	end 	
  end

  private

  	def terms_of_service_params
  		params.require(:terms_of_service).permit(:shipping_fee, 
                                               :terms, 
                                               :policy, 
                                               :disclaimer,
                                               :company_intro,
                                               :company_name,
                                               :company_address,
                                               :company_phone,
                                               :company_mail,
                                               :facebook_url,
                                               :youtube_url,
                                               :open_time,
                                               :user_sms,
                                               :ceo_sms,
                                               :ceo_phone,
                                               :send_sms_to_user,
                                               :send_sms_to_ceo )
  	end
end