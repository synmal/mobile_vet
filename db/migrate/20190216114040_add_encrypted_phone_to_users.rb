class AddEncryptedPhoneToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :encrypted_phone, :string
    remove_column :users, :phone
  end
end
