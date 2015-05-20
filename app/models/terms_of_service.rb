class TermsOfService < ActiveRecord::Base
	validates :shipping_fee, presence: true
  
end
