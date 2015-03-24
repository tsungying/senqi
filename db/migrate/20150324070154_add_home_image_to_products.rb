class AddHomeImageToProducts < ActiveRecord::Migration
  def change
    add_column :products, :home_image, :string
  end
end
