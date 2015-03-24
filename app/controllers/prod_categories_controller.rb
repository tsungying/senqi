class ProdCategoriesController < ApplicationController

	def index
		@prod_categories = ProdCategory.all
	end

  def show
  	@prod_categories = ProdCategory.all
  	@products = ProdCategory.find(params[:id]).products
  end
end
