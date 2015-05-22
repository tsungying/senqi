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

			settings = TermsOfService.first

			if settings.send_sms_to_user?
		    @client = Twilio::REST::Client.new(ENV['TEST_TWILIO_ACCOUNT_SID'], ENV['TEST_TWILIO_AUTH_TOKEN'])
		    phone = number_to_phone(order.cellphone.to_i, country_code: 886) 
		    body = "訂單編號：#{notification.merchant_trade_no}，"+settings.user_sms 
		    msg = @client.messages.create(from: '+15005550006', to: phone, body: body)
		    Rails.logger.info msg.body			
		  end

			if settings.send_sms_to_ceo?
		    @client = Twilio::REST::Client.new(ENV['TEST_TWILIO_ACCOUNT_SID'], ENV['TEST_TWILIO_AUTH_TOKEN'])
		    phone = number_to_phone(settings.ceo_phone.to_i, country_code: 886) 
		    body = settings.ceo_sms+"，消費金額為#{order.total}，付款時間：= #{ l(notification.payment_date, format: :long ) }"
		    msg = @client.messages.create(from: '+15005550006', to: phone, body: body)
		    Rails.logger.info msg.body			
		  end

		  OrderMailer.paid(order).deliver
		  # OrderMailer.ready_to_ship(order).deliver

			render text: '1|OK', status: 200
		else
			render text: '0|Fail'
		end
		
	end

end
