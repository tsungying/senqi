class CompanyInfo < ActiveRecord::Base
  mount_uploader :image, PhotoUploader
  validates_presence_of :title, :content, :language
  scope :current_language_version, ->{ where(language: I18n.locale) }
end
