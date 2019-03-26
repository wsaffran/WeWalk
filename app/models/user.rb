class User < ApplicationRecord
  has_secure_password
  has_many :appointments
  has_many :dogs
  has_many :walkee_appointments, :class_name => 'Appointment', through: :dogs
  after_initialize :init

  validates :name, :address, :city, :state, :zip_code, :dob, :password_digest, presence: true
  validates :name, uniqueness: true
  # validates :name, { :length => { in: 3..30}}
  validates :password, length: { in: 6..20 }
  validates :zip_code, { :length => { :is => 5 } }

  def init
    self.token_balance ||= 0
  end

end
