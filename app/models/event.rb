class Event < ActiveRecord::Base
  belongs_to :event_category, counter_cache: true
  validates :title, presence: true
  mount_uploader :home_image, PhotoUploader
  mount_uploader :event_image, PhotoUploader
  # attr_accessible :content, :event_image, :home_image, :summary, :title
  def self.search(search)
    if search
      where('title LIKE :search OR summary LIKE :search', search: "%#{search}%")
    end
  end  
end
