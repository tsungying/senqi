class Article < ActiveRecord::Base
  belongs_to :blog_category, counter_cache: true
  has_many :comments, as: :commentable, dependent: :destroy
  validates :title, presence: true
  mount_uploader :home_image, PhotoUploader
  mount_uploader :article_image, PhotoUploader
  # :article_image, :home_image :content, :summary,

  def self.search(search)
    if search
      where('title LIKE :search OR summary LIKE :search', search: "%#{search}%")
    end
  end  
end
