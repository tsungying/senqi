class Notification < ActiveRecord::Base

	def analyze_raw_post
		params_hash = Rack::Utils.parse_query(raw_post_data)
		test_client = Allpay::Client.new(mode: :test)
		result = test_client.verify_mac(params_hash)

		self.update_attributes(	merchant_trade_no: 	params_hash["MerchantTradeNo"],
														trade_no: 					params_hash["TradeNo"],
														rtn_code: 					params_hash["RtnCode"],
														payment_date: 			params_hash["PaymentDate"], 
														verify_mac: 				result )
	end
end
