class CartsController < ApplicationController
	# before_action :authenticate_user!
  def index
  	@order_items = current_cart.order_items
  end
end
