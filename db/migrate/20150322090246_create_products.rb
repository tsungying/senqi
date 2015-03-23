class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :part_number
      t.references :prod_category
      t.decimal :original_price
      t.decimal :selling_price
      t.text :brief
      t.text :description

      t.timestamps
    end
    add_index :products, :prod_category_id
  end
end
