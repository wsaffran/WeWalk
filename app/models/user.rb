class User < ApplicationRecord
  has_secure_password
  has_many :appointments
  has_many :dogs
  has_many :walkee_appointments, :class_name => 'Appointment', through: :dogs
  after_initialize :init

  validates :name, :address, :city, :state, :zip_code, :dob, :password_digest, presence: true
  validates :name, uniqueness: true
  # validates :name, { :length => { in: 3..30}}
  validates :password, length: { in: 6..20 }, :on => :create
  validates :zip_code, { :length => { :is => 5 } }

  before_validation :capitalize_name, :capitalize_address, :capitalize_city

  def capitalize_name
    self.name = self.name.split.collect(&:capitalize).join(' ') if self.name && !self.name.blank?
  end

  def capitalize_address
    self.address = self.address.split.collect(&:capitalize).join(' ') if self.address && !self.address.blank?
  end

  def capitalize_city
    self.city = self.city.split.collect(&:capitalize).join(' ') if self.city && !self.city.blank?
  end

  def init
    self.token_balance ||= 0
  end

end
