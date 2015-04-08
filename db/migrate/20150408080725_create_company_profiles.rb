class CreateCompanyProfiles < ActiveRecord::Migration
  def change
    create_table :company_profiles do |t|
      t.string :office_image
      t.integer :play_order, :default => 0
      t.string :brand_story

      t.timestamps null: false
    end
  end
end
