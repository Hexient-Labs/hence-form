require "rails_helper"

describe SubmissionsController, type: :controller do
  describe "POST create" do
    let(:sub) { build(:submission, user: user) }
    context "when user has no account" do
      let(:user) { build(:user) }
      it "attempts to create an account" do
        expect(CreateUser).to receive(:perform).with(email: user.email)
        post :create, params: sub.data.merge(hence_form_email: sub.to_email)
        # TODO: Expect to go to confirmation page
      end
    end

    context "when user has an unconfirmed account" do
      include ActiveJob::TestHelper

      let(:user) { create(:user) }

      before(:each) do
        clear_enqueued_jobs
      end

      it "resends the confirmation email" do
        post :create, params: sub.data.merge(hence_form_email: user.email)
        expect(enqueued_jobs.size).to eq(2)
      end
    end

    context "when user has an account" do
      let(:user) { create(:user, :confirmed) }

      it "creates a new submission" do
        expect(CreateSubmission).to receive(:perform).with(user: user, data: sub.data)
        post :create, params: sub.data.merge(hence_form_email: user.email)
        # TODO: Expect it to redirect to success page
        # expect(response).to render_template("index")
      end
    end
  end
end
