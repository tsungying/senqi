class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.text :raw_post_data

      t.timestamps null: false
    end
  end
end
