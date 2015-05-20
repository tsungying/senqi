class AddSettingsToTermsOfServices < ActiveRecord::Migration
  def change
    add_column :terms_of_services, :company_intro, :string
    add_column :terms_of_services, :company_name, :string
    add_column :terms_of_services, :company_address, :string
    add_column :terms_of_services, :company_phone, :string
    add_column :terms_of_services, :company_mail, :string
    add_column :terms_of_services, :facebook_url, :string
    add_column :terms_of_services, :youtube_url, :string
    add_column :terms_of_services, :open_time, :string
    add_column :terms_of_services, :user_sms, :string
    add_column :terms_of_services, :ceo_sms, :string
  end
end
