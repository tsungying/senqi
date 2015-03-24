class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :img
      t.integer :parent_id
      t.string :parent_type

      t.timestamps
    end
  end
end
