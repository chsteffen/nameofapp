class RegistrationsController < Devise::RegistrationsController
	before_filter :configure_permitted_parameters, :only => [:create]
  # before_action :configure_permitted_parameters, if: :devise_controller?

	def create
		super
		if @user.persisted?
			UserMailer.welcome(@user).deliver_now
		end
	end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password])
  end
end
