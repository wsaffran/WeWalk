class Dog < ApplicationRecord
  has_many :appointments
  belongs_to :user

  validates :name, :breed, :age, :hypo_allergenic, :care_info, :presence => true

end
