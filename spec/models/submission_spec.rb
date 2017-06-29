require "rails_helper"

describe Submission, type: :model do
  subject { build(:submission) }

  it "should have a valid factory" do
    expect(subject).to be_valid
  end

  # Validations
  it { should validate_presence_of(:to_email) }

  # Associations
  it { should belong_to(:user).inverse_of(:submissions) }
end
