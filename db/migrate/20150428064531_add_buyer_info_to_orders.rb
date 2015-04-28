class AddBuyerInfoToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :user, index: true
    add_foreign_key :orders, :users
    add_column :orders, :name, :string
    add_column :orders, :phone, :string
    add_column :orders, :address, :string
    add_column :orders, :order_number, :string
  end
end
