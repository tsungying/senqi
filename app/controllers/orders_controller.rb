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
    # rescue ActiveRecord::RecordNotFound

    redirect_to root_url unless @order

    # m = ENV['Test_ALLPAY_Merchant_id']
    # production_client = Allpay::Client.new({
    #   merchant_id: 1234567,
    #   hash_key: ENV['Test_ALLPAY_HashKey'],
    #   hash_iv: ENV['Test_ALLPAY_HashIV']
    # })
    # production_client = Allpay::Client.new(mode: :production)
    test_client = Allpay::Client.new(mode: :test)

    @params = test_client.generate_checkout_params({
      MerchantTradeNo: SecureRandom.hex(4),
      TotalAmount: 1000,
      TradeDesc: '腦袋有動工作室',
      ItemName: '物品一#物品二',
      ReturnURL: 'http://requestb.in/11zuej31',
      ClientBackURL: 'http://requestb.in/11zuej31?inspect',
      ChoosePayment: 'Credit',
      PeriodAmount: 1000,
      PeriodType: 'D',
      Frequency: 1,
      ExecTimes: 12,
      PeriodReturnURL: 'http://requestb.in/158bu8e1'
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

  	# def own_order
  	# 	unless session[:order_id] == current_order.id
  	# 		redirect_to root_url
  	# 	end
  	# end
end
