class AddColumnTimeToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :appointment_time, :time
  end
end
