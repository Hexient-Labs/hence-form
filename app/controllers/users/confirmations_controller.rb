class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    @user = User.find_by_confirmation_token(params[:confirmation_token])
    raise ActionController::RoutingError.new("Not Found") unless @user
    @user.confirm
    render "submissions/successful_confirmation"
  end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(*)
  #   render "submissions/successful_confirmation"
  # end
end
