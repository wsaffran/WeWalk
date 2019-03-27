class Review < ApplicationRecord
  belongs_to :walker, :class_name => 'User', :foreign_key => 'walker_id'
  belongs_to :walkee, :class_name => 'User', :foreign_key => 'walkee_id'
  # belongs_to :appointment

  validates :rating, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_that_or_equal_to: 5}
end
