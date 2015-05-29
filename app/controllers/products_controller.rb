class ProductsController < ApplicationController

  def index
    current_language_product_categories
    unless params[:product_keyword] || nil
      redirect_to prod_categories_url(locale: I18n.locale)       
    else
      @products = current_language_products.on_sale.search(params[:product_keyword])
    end
  end

  def show
    @product = Product.find(params[:id])    
    @video = @product.youtube_code.nil? ? [] : @product.youtube_code.split(",")   
    redirect_to prod_categories_url(locale: I18n.locale) if @product.prod_category.language != I18n.locale.to_s
  end

end
