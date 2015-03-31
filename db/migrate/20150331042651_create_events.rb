class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :event_category
      t.string :title
      t.text :summary
      t.text :content
      t.string :home_image
      t.string :event_image

      t.timestamps
    end
    add_index :events, :event_category_id
  end
end
