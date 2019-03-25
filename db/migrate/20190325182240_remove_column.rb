class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :appointments, :walkee_id
  end
end
