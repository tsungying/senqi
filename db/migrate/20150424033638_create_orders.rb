class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :subtotal
      t.decimal :shipping_fee
      t.decimal :total
      t.references :order_status, index: true

      t.timestamps null: false
    end
    add_foreign_key :orders, :order_statuses
  end
end
