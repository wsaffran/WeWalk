class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.integer :walker_id
      t.integer :walkee_id
      t.integer :dog_id
      t.date :appointment_date
      t.integer :walk_duration
      t.string :notes

      t.timestamps
    end
  end
end
