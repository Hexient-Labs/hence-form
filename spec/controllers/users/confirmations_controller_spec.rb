require "rails_helper"

describe Users::ConfirmationsController, type: :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "GET show" do
    context "when email is associated with a user" do
      let(:user) { create(:user) }

      it "confirms that user" do
        result = get :show, params: { confirmation_token: user.confirmation_token }
        expect(user.reload.confirmed?).to be_truthy
        expect(result).to render_template("submissions/successful_confirmation")
      end
    end

    context "when email is NOT associated with a user" do
      let(:bad_token) { SecureRandom.hex }

      it "raises an error" do
        expect do
          get :show, params: { confirmation_token: bad_token }
        end.to raise_error(ActionController::RoutingError)
      end
    end
  end
end
