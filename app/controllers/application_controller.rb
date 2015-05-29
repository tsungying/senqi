class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :add_to_cart, :current_cart, :shipping_fee, :current_language_product_categories
  before_action :set_locale

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

  def shipping_fee(default_fee: 80)
    @fee = TermsOfService.last.shipping_fee 
    rescue NoMethodError
    @fee = default_fee
  end

  def default_url_options(options = {})
  {locale: I18n.locale}
  end

  # Product part
  def current_language_product_categories
    @prod_categories = ProdCategory.where(language: I18n.locale)
  end

  def current_language_products
    products = Product.where(prod_category_id: current_language_product_categories.pluck(:id).uniq).order("id desc")
  end

  # Blog part

  def current_language_blog_categories
    @categories = BlogCategory.where(language: I18n.locale)
  end

  def current_language_articles
    articles = Article.where(blog_category_id: current_language_blog_categories.pluck(:id).uniq).order("id desc")
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :password, :password_confirmation, :current_password) }
    end

  private

    def set_locale
      I18n.locale = params[:locale] if params[:locale].present?

    end
end
