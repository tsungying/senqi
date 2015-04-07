class EventCategory < ActiveRecord::Base
	validates :name, presence: true
	has_many :events, dependent: :destroy
  # attr_accessible :events_count, :name
end
