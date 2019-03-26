class Dog < ApplicationRecord
  has_many :appointments
  belongs_to :user

  validates :name, :breed, :age, :care_info, :user_id, :presence => true
  validates :age, numericality: { greater_than_or_equal_to: 0}

  before_validation :capitalize_name, :capitalize_breed

  def capitalize_name
    self.name = self.name.split.collect(&:capitalize).join(' ') if self.name && !self.name.blank?
  end

  def capitalize_breed
    self.breed = self.breed.split.collect(&:capitalize).join(' ') if self.breed && !self.breed.blank?
  end

end
