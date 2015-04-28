class Order < ActiveRecord::Base
  belongs_to :order_status
  has_many :order_items, dependent: :destroy
  before_create :set_order_status_and_fee
  before_save :update_subtotal
  validates_presence_of :name, :phone, :address
  # create_table "orders", force: :cascade do |t|
  #   t.decimal  "subtotal",                  precision: 10
  #   t.decimal  "shipping_fee",              precision: 10
  #   t.decimal  "total",                     precision: 10
  #   t.integer  "order_status_id", limit: 4
  #   t.datetime "created_at",                null: false
  #   t.datetime "updated_at",                null: false
  # end

  def subtotal
  	# 當購物車是空的時候，返回0
  	order_items.collect { |item| item.valid? ? item.unit_price*item.quantity : 0 }.sum
  end

  def user_info(user)
    self.update_attributes(user_id: user.id, name: user.name)
  end

  def cart_items
    order_items.sum(:quantity)
  end

  private

  	def set_order_status_and_fee
  		self.order_status_id = 1 # In progress
      self.shipping_fee = TermsOfServices.last.shipping_fee
  	end

  	def update_subtotal
  		self[:subtotal] = subtotal
  	end

end
