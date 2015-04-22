class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	skip_before_action :authenticate_user!

	def all

    if request.env["omniauth.auth"].info.email.blank?
      redirect_to "/users/auth/facebook?auth_type=rerequest&scope=email"
      return
    end

		user = User.from_omniauth(request.env["omniauth.auth"])

    if user.persisted?
      sign_in_and_redirect user
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
	end

  def failure
    super
  end

	alias_method :facebook, :all
end
