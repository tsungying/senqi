class ProdCategoriesController < ApplicationController

	def index
		@prod_categories = ProdCategory.all
		@order_item = current_order.order_items.new
	end

  def show
  	@prod_categories = ProdCategory.all
  	@products = ProdCategory.find(params[:id]).products
  end
end
