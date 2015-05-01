class CreateAtmPaymentInfos < ActiveRecord::Migration
  def change
    create_table :atm_payment_infos do |t|
      t.text :raw_post_data

      t.timestamps null: false
    end
  end
end
