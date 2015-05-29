class AddLanguageToProdCategories < ActiveRecord::Migration
  def change
    add_column :prod_categories, :language, :string, default: 'en'
  end
end
