class Admin::BaseController < ActionController::Base
	protect_from_forgery
	layout 'admin'
	before_action :authenticate_admin!



end