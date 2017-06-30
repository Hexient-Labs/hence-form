require "rails_helper"

describe SubmissionsController, type: :controller do
  describe "POST create" do
    context "when user has no account" do
      let (:user) { build(:user) }
      let (:sub) { build(:submission, user: user) }
      it "attempts to create an account" do
        expect(CreateUser).to receive(:perform).with(email: user.email)
        post :create, params: sub.data.merge(hence_form_email: sub.to_email)
        # TODO: Expect to go to confirmation page
      end
    end

    context "when user has an unconfirmed account" do
      # post(:index)
      # it calls the unconfirmed service
    end

    context "when user has an account" do
      let (:user) { create(:user, :confirmed) }
      let (:sub) { build(:submission, user: user) }

      it "creates a new submission" do
        expect(CreateSubmission).to receive(:perform).with(user: user, data: sub.data)
        post :create, params: sub.data.merge(hence_form_email: user.email)
        # TODO: Expect it to redirect to success page
        # expect(response).to render_template("index")
      end
    end
  end
end
