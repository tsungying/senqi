class Order < ActiveRecord::Base
  belongs_to :order_status
  belongs_to :cart
  belongs_to :user
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

  # def cart_items
  #   order_items.sum(:quantity)
  # end

  def add_cart_info(cart)
    self.cart_id = cart.id
    self.subtotal = cart.order_items.sum(:total_price)
    self.shipping_fee = TermsOfService.last.shipping_fee
    self.total = subtotal + shipping_fee
    self.order_status_id = 2
    self.order_number = Time.now.strftime("%Y%m%d%H%M%S%3N")
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
