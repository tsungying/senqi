class Order < ActiveRecord::Base
  belongs_to :order_status
  has_many :order_items
  before_create :set_order_status
  before_save :update_subtotal

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

  private

  	def set_order_status
  		self.order_status_id = 1 # In progress
  	end

  	def update_subtotal
  		self[:subtotal] = subtotal
  	end

end
