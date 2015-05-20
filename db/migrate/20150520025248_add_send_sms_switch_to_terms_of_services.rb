class AddSendSmsSwitchToTermsOfServices < ActiveRecord::Migration
  def change
    add_column :terms_of_services, :send_sms_to_user, :boolean, default: false
    add_column :terms_of_services, :send_sms_to_ceo, :boolean, default: false
  end
end
