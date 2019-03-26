class User < ApplicationRecord
  has_secure_password
  has_many :appointments
  has_many :dogs
  has_many :walkee_appointments, :class_name => 'Appointment', through: :dogs
  after_initialize :init

  def init
    self.token_balance ||= 0
  end

end
