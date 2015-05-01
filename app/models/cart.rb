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

	private

	 #  def update_subtotal
		# 	self[:subtotal] = subtotal
		# end

end
