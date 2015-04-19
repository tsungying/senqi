class AddYoutubeCodeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :youtube_code, :text
  end
end
