class AddPhoneIvToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone_iv, :string
  end
end
