class HomePage < ActiveRecord::Base
	# t.string :logo
	# t.string :slider
	# t.integer :play_order, :default => 0
	mount_uploader :logo, PhotoUploader
	mount_uploader :slider, PhotoUploader
	validates :play_order, presence: true
end
