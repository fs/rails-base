class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    else
      super # Use the default one
    end
  end

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
end
