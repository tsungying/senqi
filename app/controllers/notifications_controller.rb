class NotificationsController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:create]
	def create
		complete_notification = request.raw_post
		Notification.create!(raw_post_data: complete_notification)
		render text: '1|OK', status: 200
	end

end
