class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery
  responders :flash
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  helper do
    def current_user
      UserPresenter.new(warden.authenticate(scope: :user))
    end
  end

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protected

  def user_not_authorized
    redirect_to(root_path)
  end

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    else
      super
    end
  end
end
