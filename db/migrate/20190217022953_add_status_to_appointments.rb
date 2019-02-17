class AddStatusToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :status, :integer, default: 0
    remove_column :appointments, :appointment_status
  end
end
