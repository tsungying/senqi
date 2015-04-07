class ProdCategory < ActiveRecord::Base
	has_many :products, dependent: :destroy
	validates :name, presence: true
  #attr_accessible :name
end
