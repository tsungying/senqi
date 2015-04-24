class OrderItem < ActiveRecord::Base

  # create_table "order_items", force: :cascade do |t|
  #   t.integer  "product_id",  limit: 4
  #   t.integer  "order_id",    limit: 4
  #   t.decimal  "unit_price",            precision: 10
  #   t.integer  "quantity",    limit: 4
  #   t.decimal  "total_price",           precision: 10
  #   t.datetime "created_at",                           null: false
  #   t.datetime "updated_at",                           null: false
  # end
  	
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :order_present

  before_save :finalize

  def unit_price
  	if persisted?
  		self[:unit_price]
  	else
  		product.selling_price
  	end
  end

  def total_price
  	unit_price*quantity
  end

  private

  	def product_present
  		if product.nil?
  			errors.add(:product, '該商品已下架或補貨中！')
  		end
  	end

  	def order_present
  		if order.nil?
  			errors.add(:order, '無效的訂單')
  		end
  	end

  	def finalize
  		self[:unit_price] = unit_price
  		self[:total_price] = quantity * self[:unit_price]
  	end
end
