class ApplicationController < ActionController::Base
  include Rails.application.routes.url_helpers
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :profile, :occupation, :position])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation, :profile, :occupation, :position])
  end
end
