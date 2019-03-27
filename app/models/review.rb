class Review < ApplicationRecord
  belongs_to :user, required: false
end
