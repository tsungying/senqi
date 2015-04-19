class ProductsController < ApplicationController

  def show
  	@product = Product.find(params[:id])
  	@video = @product.youtube_code.nil? ? [] : @product.youtube_code.split(",")
  end

end
