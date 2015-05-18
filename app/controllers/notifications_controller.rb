class NotificationsController < ApplicationController
	include ActionView::Helpers::NumberHelper
	skip_before_action :verify_authenticity_token, only: [:create]

	def create
		complete_notification = request.raw_post
		notification = Notification.create!(raw_post_data: complete_notification)
		notification.analyze_raw_post
		if notification.verify_mac
			order = Order.find_by_merchant_trade_no(notification.merchant_trade_no)
			order.update_attributes(order_status_id: 2)

	    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
	    phone = number_to_phone(order.cellphone.to_i, country_code: 886) 
	    body = "Miracode已收到您的付款完成通知，訂單編號#{order.merchant_trade_no}，我們會儘快為您出貨，謝謝！"
	    msg = @client.messages.create(from: '+18575984857', to: phone, body: body)
	    Rails.logger.info msg.body			

			render text: '1|OK', status: 200
		else
			render text: '0|Fail'
		end
		
	end

end
