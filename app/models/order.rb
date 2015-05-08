class Order < ActiveRecord::Base
  # paginates_per 2

  belongs_to :order_status
  belongs_to :cart
  belongs_to :user
  belongs_to :payment
  # before_create :set_order_status_and_fee
  # before_save :finalize
  validates_presence_of :name, :phone, :address

  # t.decimal  "subtotal",        precision: 10
  # t.decimal  "shipping_fee",    precision: 10
  # t.decimal  "total",           precision: 10
  # t.integer  "order_status_id", limit: 4
  # t.integer  "user_id",         limit: 4
  # t.string   "name",            limit: 255
  # t.string   "phone",           limit: 255
  # t.string   "address",         limit: 255
  # t.string   "order_number",    limit: 255
  # t.integer  "cart_id",         limit: 4

  # def subtotal
  	# 當購物車是空的時候，返回0
  	# order_items.collect { |item| item.valid? ? item.unit_price*item.quantity : 0 }.sum
  # end

  # def user_info(user)
  #   self.update_attributes(user_id: user.id, name: user.name)
  # end

  def self.check_atm_timeout
    where(order_status_id: 5).each do |order|
      info = AtmPaymentInfo.find_by_merchant_trade_no(order.merchant_trade_no)
      order.update_attributes(order_status_id: 4) if Time.now > info.expire_date
    end 
  end

  def pending?
    self.order_status_id == 1 || self.order_status_id == 5
  end

  def paid?
    self.order_status_id == 2
  end

  def shipped?
    self.order_status_id == 3
  end

  def has_order_no?
    self.order_status_id == 2
  end

  def color_merchant_trade_no
    if self.paid? || self.shipped?
      y = "<strong class='text-primary'>#{self.merchant_trade_no[0..3]}</strong> "
      md = "<strong class='text-danger'>#{self.merchant_trade_no[4..7]}</strong> "
      hms = "<strong class='text-success'>#{self.merchant_trade_no[8..13]}</strong> "
      n_6_digit = "<strong class='text-warning'>#{self.merchant_trade_no[14..19]}</strong>"
      str = y+md+hms+n_6_digit
    end
  end

  def cart_item_name
    str = ''
    cart.order_items.each do |item|
      str+="#{item.product.name}x#{item.quantity}#"
    end
    str
  end

  def add_cart_info(cart)
    self.cart_id = cart.id
    self.subtotal = cart.order_items.sum(:total_price)
    self.shipping_fee = TermsOfService.last.shipping_fee
    self.total = subtotal + shipping_fee
    self.order_status_id = 1
    # self.order_number = Time.now.strftime("%Y%m%d%H%M%S%3N")
  end

  def get_payment_info
    AtmPaymentInfo.find_by_merchant_trade_no(self.merchant_trade_no)
    # AtmPaymentInfo.where(merchant_trade_no: self.merchant_trade_no).last
  end

  def get_payment_time
    Notification.find_by_merchant_trade_no(self.merchant_trade_no).payment_date    
  end

  private

  	# def set_order_status_and_fee
  	# 	self.order_status_id = 1 # In progress
   #    self.shipping_fee = TermsOfService.last.shipping_fee
  	# end

  	# def update_subtotal
  	# 	self[:subtotal] = subtotal
  	# end

end
