class AtmPaymentInfosController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:create]
	def create
		payment_info = request.raw_post
		atm_payment_info = AtmPaymentInfo.create!(raw_post_data: payment_info)
		atm_payment_info.analyze_raw_post
		
		# RtnCode: ATM = 2:取號成功
	end
end
