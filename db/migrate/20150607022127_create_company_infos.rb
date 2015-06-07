class CreateCompanyInfos < ActiveRecord::Migration
  def change
    create_table :company_infos do |t|
      t.string :image
      t.string :title
      t.text :content
      t.string :language

      t.timestamps null: false
    end
  end
end
