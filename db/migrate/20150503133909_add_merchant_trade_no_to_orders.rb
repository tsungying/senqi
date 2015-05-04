class AddMerchantTradeNoToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :merchant_trade_no, :string
  end
end
