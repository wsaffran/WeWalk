class EditColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :appointments, :appointment_time, :string
  end
end
