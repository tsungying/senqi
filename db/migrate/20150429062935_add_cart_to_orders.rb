class AddCartToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :cart, index: true, foreign_key: true
  end
end
