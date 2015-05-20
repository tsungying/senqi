class ProductsController < ApplicationController

	def index
		@prod_categories = ProdCategory.all
		@products = Product.on_sale.search(params[:product_keyword])
	end

  def show
  	@product = Product.find(params[:id])
  	@video = @product.youtube_code.nil? ? [] : @product.youtube_code.split(",")
  end

end
