class ApplicationController < ActionController::Base
  include Authentication
  include Authorization

  protect_from_forgery
  responders :flash

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
end
