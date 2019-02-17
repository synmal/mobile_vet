class CreateDiagnoses < ActiveRecord::Migration[5.2]
  def change
    create_table :diagnoses do |t|
      t.references :appointment, foreign_key: true
      t.string :comments
      t.integer :price
      t.boolean :payment_status, default: false
      t.timestamps
    end
  end
end
