module ApplicationHelper
	def logo_img
		@home_logo = HomePage.where( slider: nil ).order("play_order desc").first
	end
end
