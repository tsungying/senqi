class ApplicationController < ActionController::Base
  protect_from_forgery

  # layout :layout

  # private

  # def layout
  # 	if devise_controller? && devise_mapping.name == :admin
  # 		"admin"
  # 	else
  # 		"application"
  # 	end
  # end
end
