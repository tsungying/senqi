class RemoveOrderIdFromOrderItems < ActiveRecord::Migration
  def change
    remove_reference :order_items, :order, index: true, foreign_key: true
  end
end
