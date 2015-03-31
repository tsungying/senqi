class EventCategory < ActiveRecord::Base
	validates :name, presence: true
	has_many :events
  # attr_accessible :events_count, :name
end
