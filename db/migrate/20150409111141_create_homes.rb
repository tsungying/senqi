class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :logo
      t.string :slider
      t.integer :play_order

      t.timestamps null: false
    end
  end
end
