class AddSectionToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :section, :string, default: "product_photo"
  end
end
