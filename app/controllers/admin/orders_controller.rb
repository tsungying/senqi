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
  	end
  	
  end

  def show
  end

  def new
  end

  def edit
  end
end
