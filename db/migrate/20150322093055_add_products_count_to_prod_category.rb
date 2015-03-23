class AddProductsCountToProdCategory < ActiveRecord::Migration
  def change
    add_column :prod_categories, :products_count, :integer, :default => 0

    ProdCategory.pluck(:id).each do |i|
      ProdCategory.reset_counters(i, :products) # 全部重算一次
    end
  end
end
