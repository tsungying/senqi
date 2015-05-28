class AddLanguageToBlogCategories < ActiveRecord::Migration
  def change
    add_column :blog_categories, :language, :string, default: 'en'
  end
end
