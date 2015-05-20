class AddCeoPhoneToTermsOfServices < ActiveRecord::Migration
  def change
    add_column :terms_of_services, :ceo_phone, :string
  end
end
