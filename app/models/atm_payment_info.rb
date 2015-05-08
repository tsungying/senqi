class AtmPaymentInfo < ActiveRecord::Base
	#   add_column :atm_payment_infos, :merchant_trade_no, :string
  #   add_column :atm_payment_infos, :trade_no, :string
  #   add_column :atm_payment_infos, :bank_code, :string
  #   add_column :atm_payment_infos, :v_account, :string
  #   add_column :atm_payment_infos, :expire_date, :datetime
  #   add_column :atm_payment_infos, :rtn_code, :integer
  #   add_column :atm_payment_infos, :verify_mac, :boolean	

	before_save :set_expire_date_to_end_of_day

	def analyze_raw_post
		params_hash = Rack::Utils.parse_query(raw_post_data)
		test_client = Allpay::Client.new(mode: :test)
		result = test_client.verify_mac(params_hash)

		self.update_attributes(	merchant_trade_no: 	params_hash["MerchantTradeNo"],
														trade_no: 					params_hash["TradeNo"],
														bank_code: 					params_hash["BankCode"],
														v_account: 					params_hash["vAccount"],
														expire_date: 				params_hash["ExpireDate"],
														rtn_code: 					params_hash["RtnCode"],
														verify_mac: 				result )
		if self.rtn_code == 2 && self.verify_mac
			Order.find_by_merchant_trade_no(self.merchant_trade_no).update_attributes(order_status_id: 5)
		end
	
	end

	private

		def set_expire_date_to_end_of_day
			self.expire_date = expire_date.end_of_day
		end

end
