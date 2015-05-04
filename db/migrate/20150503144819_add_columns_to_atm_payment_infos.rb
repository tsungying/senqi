class AddColumnsToAtmPaymentInfos < ActiveRecord::Migration
  def change
    add_column :atm_payment_infos, :merchant_trade_no, :string
    add_column :atm_payment_infos, :trade_no, :string
    add_column :atm_payment_infos, :bank_code, :string
    add_column :atm_payment_infos, :v_account, :string
    add_column :atm_payment_infos, :expire_date, :datetime
    add_column :atm_payment_infos, :rtn_code, :integer
    add_column :atm_payment_infos, :verify_mac, :boolean
  end
end
