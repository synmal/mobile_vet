class ChangeDefaultAppointmentStatus < ActiveRecord::Migration[5.2]
  def change
    change_column :appointments, :appointment_status, :boolean, :default => false
  end
end
