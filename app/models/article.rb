class Article < ActiveRecord::Base
  belongs_to :blog_category, counter_cache: true
  has_many :comments, as: :commentable
  validates :title, presence: true
  mount_uploader :home_image, PhotoUploader
  mount_uploader :article_image, PhotoUploader
  # :article_image, :home_image :content, :summary,
end
