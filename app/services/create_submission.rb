class CreateSubmission
  def self.perform(user:, data:)
    submission = _create_submission(user: user, data: data)
    _send_notice_to_user(submission: submission)
    submission
  end

  class << self
    private

    def _create_submission(user:, data:)
      user.submissions.create!(
        to_email: user.email,
        data: data
      )
    end

    def _send_notice_to_user(submission:)
      SubmissionsMailer.new_submission(submission: submission).deliver_later
    end
  end
end
