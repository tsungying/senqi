class NotificationsController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:create]
	def create
		complete_notification = request.raw_post
		notification = Notification.create!(raw_post_data: complete_notification)
		notification.analyze_raw_post
		if notification.verify_mac
			Order.find_by_merchant_trade_no(self.merchant_trade_no).update_attributes(order_status_id: 2)
			render text: '1|OK', status: 200
		else
			render text: '0|Fail'
		end
		
	end

end
