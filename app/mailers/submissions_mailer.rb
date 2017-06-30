class SubmissionsMailer < ApplicationMailer
  def new_submission(submission:)
    @submission = submission
    @user = submission.user
    mail(to: submission.to_email, subject: "New Submission from Hexient Labs")
  end
end
