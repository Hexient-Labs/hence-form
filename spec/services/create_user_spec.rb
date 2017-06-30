require "rails_helper"

describe CreateUser do
  subject { described_class }

  it "creates a user with the email given" do
    email = generate(:email)
    expect do
      subject.perform(email: email)
    end.to change { User.count }.by(1)
  end
end
