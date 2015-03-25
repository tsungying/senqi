class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :blog_category
      t.string :title
      t.text :summary
      t.text :content
      t.string :home_image
      t.string :article_image

      t.timestamps
    end
    add_index :articles, :blog_category_id
  end
end
