require "rails_helper"

describe Submission, type: :model do
  subject { build(:submission) }

  it "should have a valid factory" do
    expect(subject).to be_valid
  end

  it { should belong_to(:user) }
end
