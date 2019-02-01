class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

      def configure_permitted_parameters
        #added_attrs = [ :email, :password, :password_confirmation, :firstName, :lastName, :address]
        devise_parameter_sanitizer.permit :sign_up, keys: [:email, :password, :firstName, :lastName, :address]
        devise_parameter_sanitizer.permit :account_update, keys: [:email, :password, :current_password, :firstName, :lastName, :address]
      end
end
