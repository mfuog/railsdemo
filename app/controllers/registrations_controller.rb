class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name]
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name]
  end

  def sign_up_params
    params.require(:user)
          .permit(:first_name,
                  :last_name,
                  :email,
                  :role,              
                  :password,
                  :password_confirmation)
  end
 
  def account_update_params
    params.require(:user)
          .permit(:first_name,
                  :last_name,
                  :email,
                  :role,              
                  :password,
                  :password_confirmation,
                  :current_password)
  end
end