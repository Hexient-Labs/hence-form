class Submission < ApplicationRecord
  # Validations
  validate :email, presence: true

  # Associations
  belongs_to :user
end
