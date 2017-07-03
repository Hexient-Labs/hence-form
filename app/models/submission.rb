# == Schema Information
#
# Table name: submissions
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  to_email   :string           not null
#  data       :jsonb            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_submissions_on_user_id  (user_id)
#

class Submission < ApplicationRecord
  # Validations
  validates :to_email, presence: true

  # Associations
  belongs_to :user, inverse_of: "submissions"
end
