class ApplicationController < ActionController::API
	#include RailsWarden::Authentication
	#protect_from_forgery unless: -> { request.format.json? }
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    added_attrs = [:user_name, :password, :password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
	end
	
end