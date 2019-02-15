class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :avatar
      t.string :name
      t.string :address
      t.string :email
      t.integer :roles, default: 1
      t.string :password_digest
      t.timestamps
    end
  end
end
