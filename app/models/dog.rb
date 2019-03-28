class Dog < ApplicationRecord
  has_many :appointments
  belongs_to :user

  after_initialize :init

  validates :name, :breed, :age, :user_id, :presence => true
  validates :age, numericality: { greater_than_or_equal_to: 0}

  before_validation :capitalize_name, :capitalize_breed

  def capitalize_name
    self.name = self.name.split.collect(&:capitalize).join(' ') if self.name && !self.name.blank?
  end

  def capitalize_breed
    self.breed = self.breed.split.collect(&:capitalize).join(' ') if self.breed && !self.breed.blank?
  end

  def init
    self.image ||= "https://www.shareicon.net/download/2016/09/30/837686_animal_512x512.png"
  end

end
