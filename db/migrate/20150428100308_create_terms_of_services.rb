class CreateTermsOfServices < ActiveRecord::Migration
  def change
    create_table :terms_of_services do |t|
      t.decimal :shipping_fee
      t.text :terms
      t.text :policy
      t.text :disclaimer

      t.timestamps null: false
    end
  end
end
