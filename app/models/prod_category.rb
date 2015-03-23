class ProdCategory < ActiveRecord::Base
	has_many :products
	validates :name, presence: true
  #attr_accessible :name
end
