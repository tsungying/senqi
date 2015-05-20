class OrderItemsController < ApplicationController
	
  def create
  	@cart = current_cart
    
    # 檢查目前購物車是否已有該商品
    @order_item = @cart.order_items.find_by_product_id(params[:order_item][:product_id])
    if @order_item.nil?
      @order_item = @cart.order_items.new(order_item_params)
    else
      @order_item.quantity += params[:order_item][:quantity].to_i
    end
    @order_item.save   
  	
  	session[:cart_id] = @cart.id
  end

  def update
  	@cart = current_cart
  	@order_item = @cart.order_items.find(params[:id])
  	@order_item.update_attributes(order_item_params)
  	@order_items = @cart.order_items
  end

  def destroy
  	@cart = current_cart
  	@order_item = @cart.order_items.find(params[:id])
  	@order_item.destroy
  	@order_items = @cart.order_items  	
  end

  private

  	def order_item_params
  		params.require(:order_item).permit(:quantity, :product_id)
  	end

end
