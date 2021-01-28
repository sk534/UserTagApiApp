

class Api::V1::SessionsController < Api::V1::ApiController
  def create
    @user = User.find_by(email: params[:email])
    return invalid_login_attempt unless @user
    if @user&.valid_password?(params[:password]) && !@user.authentication_token.nil?
      render json: @user.as_json(only: [:email,:authentication_token]),status: :created
    else
      head(:unauthorized)
    end
  end

  def destroy
  end

  protected
  def invalid_login_attempt
    warden.custom_failure!
    render :json=> {:success=>false}
  end
end