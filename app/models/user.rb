class User < ApplicationRecord
  has_many :appointments
  has_many :dogs
  has_many :walkee_appointments, :class_name => 'Appointment', through: :dogs
end
