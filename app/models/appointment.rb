class Appointment < ApplicationRecord
  # belongs_to :user
  belongs_to :dog
  belongs_to :walker, :class_name => 'User', :foreign_key => 'walker_id', optional: true

  validates :dog_id, :appointment_date, :walk_duration, :notes, :appointment_time, :presence => true

end
