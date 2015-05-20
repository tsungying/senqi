class Product < ActiveRecord::Base
  # serialize :youtube_code, Array
  scope :on_sale, ->{ where(active: true) }
  belongs_to :prod_category, counter_cache: true
  has_many :pictures, as: :parent, dependent: :destroy
  has_many :order_items
  accepts_nested_attributes_for :pictures
  mount_uploader :home_image, PhotoUploader
  before_save :downcase_part_number, :remove_white_spaces
  validates_presence_of :name, :part_number, :original_price, :selling_price, :brief#, :description
  validates :part_number, uniqueness: { case_sensitive: false }
  #attr_accessible :brief, :description, :name, :original_price, :part_number, :selling_price

  def self.search(search)
    if search
      where('name LIKE :search OR brief LIKE :search', search: "%#{search}%")
    end
  end
  
  private
  	def downcase_part_number
  		self.part_number = self.part_number.downcase
  	end

    def remove_white_spaces
      self.youtube_code = self.youtube_code.delete(' ')
    end
end
