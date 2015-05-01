class AtmPaymentInfosController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:create]
	def create
		payment_info = request.raw_post
		AtmPaymentInfo.create!(raw_post_data: payment_info)
	end
end
