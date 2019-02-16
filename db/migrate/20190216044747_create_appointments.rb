class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.references :user, foreign_key: true
      t.references :pet, foreign_key: true
      t.text :description
      t.date :appointment_date
      t.string :location
      t.boolean :appointment_status

      t.timestamps
    end
  end
end
