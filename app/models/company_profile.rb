class CompanyProfile < ActiveRecord::Base
	mount_uploader :office_image, PhotoUploader
	mount_uploader :brand_story, PhotoUploader
	validates :play_order, presence: true
end
