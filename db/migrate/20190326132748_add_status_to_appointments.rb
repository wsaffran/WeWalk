class AddStatusToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :status, :string
  end
end
