class Admin::BaseController < ActionController::Base
	protect_from_forgery
	layout 'admin'
	before_action :authenticate_user!

	before_action  do
		redirect_to root_url unless current_user && current_user.admin?
	end

end