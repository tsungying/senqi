class ProductsController < ApplicationController

  def index
  	# @prodCategories = ProdCategory.all
  	# @products = @prodCategories.find(params[:id]).products
  end

  def show
  	@product = Product.find(params[:id])
  end

end
