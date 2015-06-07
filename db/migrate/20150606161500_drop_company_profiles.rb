class DropCompanyProfiles < ActiveRecord::Migration
  def change
    drop_table :company_profiles
  end
end
