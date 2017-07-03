class SubmissionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    #   Call Service Object
    if current_user&.confirmed?
      CreateSubmission.perform(user: current_user, data: create_params)
    #   TODO: Route to thanks page
    elsif current_user # Also means user is not confirmed
      current_user.send_confirmation_instructions
      # TODO: Need to route to page asking them to confirm
    else
      CreateUser.perform(email: param_email)
      # TODO: Route to confirmation page
    end
  end

  private

  def param_email
    params[:hence_form_email]
  end

  def current_user
    @_current_user ||= User.find_by_email(param_email)
  end

  def create_params
    request.request_parameters
  end
end
