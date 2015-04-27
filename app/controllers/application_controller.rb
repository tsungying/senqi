class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_order, :current_cart

  def current_order
    if session[:order_id].nil?
      Order.new
    else
      Order.find(session[:order_id])
    end
  end

  def current_cart
    current_order.order_items.new
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :password, :password_confirmation, :current_password) }
    end

end
