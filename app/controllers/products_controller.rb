class ProductsController < ApplicationController

  def index
  	# @prodCategories = ProdCategory.all
  	# @products = @prodCategories.find(params[:id]).products
  end

  def show
  	@product = Product.find(params[:id])
  end

  def new
  end

  def edit
  	
  end
end
