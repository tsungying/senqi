class AddCartToOrderItems < ActiveRecord::Migration
  def change
    add_reference :order_items, :cart, index: true
    add_foreign_key :order_items, :carts
  end
end
