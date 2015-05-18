class RenameOrdersPhoneColumn < ActiveRecord::Migration
  def change
  	rename_column :orders, :phone, :cellphone
  end
end
