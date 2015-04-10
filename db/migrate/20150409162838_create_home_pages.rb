class CreateHomePages < ActiveRecord::Migration
  def change
    create_table :home_pages do |t|
      t.string :logo
      t.string :slider
      t.integer :play_order, default: 0

      t.timestamps null: false
    end
  end
end
