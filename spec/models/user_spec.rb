require "rails_helper"

describe User, type: :model do
  subject { build(:user) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:password) }

  it "should have a valid factory" do
    expect(subject).to be_valid
  end

  #  Associations
  it { should have_many(:submissions) }
end
