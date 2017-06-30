require "rails_helper"

describe SubmissionsMailer, type: :mailer do
  describe "new_submission" do
    let(:submission) { build(:submission) }
    let(:mail) { described_class.new_submission(submission: submission).deliver_now }

    it "renders the subject" do
      expect(mail.subject).to eq("New Submission from Hexient Labs")
    end

    it "renders the receiver email" do
      expect(mail.to).to eq([submission.to_email])
    end

    it "renders the sender email" do
      expect(mail.from).to eq([ENV["SMTP_FROM_EMAIL"]])
    end
  end
end
