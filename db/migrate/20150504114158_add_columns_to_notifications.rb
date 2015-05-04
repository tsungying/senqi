class AddColumnsToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :merchant_trade_no, :string
    add_column :notifications, :trade_no, :string
    add_column :notifications, :rtn_code, :integer
    add_column :notifications, :payment_date, :datetime
    add_column :notifications, :verify_mac, :boolean
  end
end
