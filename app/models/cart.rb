class Cart < ActiveRecord::Base
	has_many :order_items, dependent: :destroy
	has_one :order
	# before_save :update_subtotal

	def subtotal
  	# 當購物車是空的時候，返回0
  	order_items.collect { |item| item.valid? ? item.unit_price*item.quantity : 0 }.sum
  end

  def total_quantity
   	order_items.sum(:quantity)
  end

  def self.clear_abandoned
  	cid = Cart.all.pluck(:id)
  	oid = Order.all.pluck(:cart_id)
  	Cart.where(id: cid-oid).destroy_all
  end

end
