class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
  end

  # private

  # def layout
  # 	if devise_controller? && devise_mapping.name == :admin
  # 		"admin"
  # 	else
  # 		"application"
  # 	end
  # end
end
