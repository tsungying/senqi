class AddYoutubeVideoAndCoverToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :youtube_video, :string
    add_column :articles, :cover, :string, default: "article_image"
  end
end
