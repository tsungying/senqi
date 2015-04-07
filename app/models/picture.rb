class Picture < ActiveRecord::Base
	mount_uploader :img, PhotoUploader
	belongs_to :parent, polymorphic: true
	
  # attr_accessible :img, :parent_id, :parent_type
end
