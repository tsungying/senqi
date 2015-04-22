class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :provider
      t.string :uid
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :authorizations, :users
  end
end
