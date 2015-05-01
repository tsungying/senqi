class OrdersController < ApplicationController
	before_action :ensure_order_has_item, only: [:new, :create]
	before_action :authenticate_user!	
	# before_action :own_order, only: [:edit, :update]


  #require 'lib/Allpay'

  def index
    @orders = valid_order.order(id: :desc).page(params[:page])
  end

  def new
    @order = current_user.orders.new
  end

  def create
    @order = current_user.orders.new(order_params)
    @order.add_cart_info(current_cart)
    if @order.save
      session[:cart_id] = nil
      flash[:placed_order] = '訂單建立成功！感謝您的購買，歡迎您再次蒞臨！'
      redirect_to @order
    else
      render 'new'
    end
  end

  def show
    @order = valid_order.find_by_id(params[:id])
    redirect_to root_url unless @order

    test_client = Allpay::Client.new(mode: :test)

    @params = test_client.generate_checkout_params({
      TotalAmount: @order.total,
      TradeDesc: 'Miracode',
      ItemName: 'qq',
      ReturnURL: 'http://requestb.in/11zuej31',
      ClientBackURL: order_url(@order),
      ChoosePayment: 'WebATM'
      # PeriodAmount: 1000,
      # PeriodType: 'D',
      # Frequency: 1,
      # ExecTimes: 12,@order.cart_item_name
      # PeriodReturnURL: 'http://requestb.in/158bu8e1'
    })   
  end

  # def edit
  # 	@order = Order.find(params[:id])
  # 	@order.user_info(current_user)
  # end

  # def update
  # 	@order = Order.find(params[:id])
  # 	if @order.update_attributes(order_params)
  # 		redirect_to carts_url
  # 	else
  # 		render :edit
  # 	end

  # end

  private

  	def ensure_order_has_item	
  		if current_cart.order_items.empty?
  			flash[:empty_cart] = "請選購商品後再進行結帳！"
  			redirect_to carts_url
  		end
  	end

  	def order_params
  		params.require(:order).permit(:name, :phone, :address, :payment_id)
  	end

    def valid_order
      current_user.orders.where(order_status: (1..3).to_a)
    end

end
