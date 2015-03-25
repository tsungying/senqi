class AddArticlesCountToBlogCategories < ActiveRecord::Migration
  def change
    add_column :blog_categories, :articles_count, :integer, :default => 0
    BlogCategory.pluck(:id).each do |i|
      BlogCategory.reset_counters(i, :articles) # 全部重算一次
    end
  end
end
