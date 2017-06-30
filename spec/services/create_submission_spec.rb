require "rails_helper"

describe CreateSubmission do
  subject { described_class }

  let(:user) { create(:user) }
  let(:submission) { build(:submission) }

  it "creates a new submission and mails it out" do
    expect(SubmissionsMailer).to receive(:new_submission).and_call_original
    expect do
      subject.perform(user: user, data: submission.data)
    end.to change { Submission.count }.by(1)
  end
end
