class Submission < ApplicationRecord
  # Validations
  validates :to_email, presence: true

  # Associations
  belongs_to :user, inverse_of: "submissions"
end
