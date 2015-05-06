class Admin::OrdersController < Admin::BaseController

	# 1 = 尚未付款
	# 2 = 已付款
	# 3 = 已出貨
	# 4 = 取消訂單
	# 5 = 取號成功
  def index
  	case params[:status]
	  	when 'pending_orders'
	  		@orders = Order.where(order_status_id: [1, 5]).page(params[:page])
	  	when 'paid_orders'
	  		@orders = Order.where(order_status_id: 2).page(params[:page])
	  	when 'shipped_orders'
	  		@orders = Order.where(order_status_id: 3).page(params[:page])
	  	when 'cancel_orders'
	  		@orders = Order.where(order_status_id: 4).page(params[:page])
	  	else
	  		@orders = Order.all.order(id: :desc).page(params[:page])
  	end  	
  end

  def show
  	@order = Order.find(params[:id])
  end

  def update
  	@order = Order.find(params[:id])

  	case params[:change_status]
	  	when 'shipped'
	  		@order.update_attributes(order_status_id: 3)
	  	when 'paid'
	  		@order.update_attributes(order_status_id: 2)
	  	when 'cancel'
	  		@order.update_attributes(order_status_id: 5)
  	end

  	respond_to do |format|
		  format.js {render inline: "location.reload();" }
		end  	
  end

  def new
  end

  def edit
  end
end
