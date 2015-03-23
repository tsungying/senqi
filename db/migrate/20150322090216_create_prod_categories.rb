class CreateProdCategories < ActiveRecord::Migration
  def change
    create_table :prod_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
