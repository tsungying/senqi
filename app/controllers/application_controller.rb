class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :add_to_cart, :current_cart, :shipping_fee

  # def current_order
  #   if session[:order_id].nil?
  #     Order.new
  #   else
  #     Order.find(session[:order_id])
  #   end
  # end

  # def current_cart
  #   current_order.order_items.new
  # end

  def current_cart
    if session[:cart_id].nil?
      Cart.new
    else
      Cart.find(session[:cart_id])
    end    
  end

  def add_to_cart
    current_cart.order_items.new
  end

  def shipping_fee
    @fee||=TermsOfService.last.shipping_fee
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :password, :password_confirmation, :current_password) }
    end

end
