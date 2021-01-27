module WardenHelper
  extend ActiveSupport::Concern

  included do
    helper_method :warden, :current_user

    prepend_before_action :authenticate!
  end

  def current_user
    warden.user
  end

  def warden
    request.env['warden']
  end

  def authenticate!  
    if request.headers["HTTP_X_USER_NAME"].present? && request.headers["HTTP_X_AUTH_TOKEN"].present?
      user = User.find_by(user_name:request.headers["HTTP_X_USER_NAME"])
      if !user.nil? && user.authentication_tokens.where('body=?',request.headers["HTTP_X_AUTH_TOKEN"]).length > 0 
        return true
      else
        render :json=>{:success=>false, :message=>"unauthorized_user"} and return
      end
    else
      render :json=>{:success=>false, :message=>"unauthorized_user"} and return
    end
  end
end

