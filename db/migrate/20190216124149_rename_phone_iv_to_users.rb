class RenamePhoneIvToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :phone_iv, :encrypted_phone_iv
  end
end
