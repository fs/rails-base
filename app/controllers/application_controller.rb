class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include BulletHelper

  protect_from_forgery with: :exception
  prepend_view_path Rails.root.join("frontend")

  responders :flash
  respond_to :html
end
