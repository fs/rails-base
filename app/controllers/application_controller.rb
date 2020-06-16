class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include BulletHelper

  protect_from_forgery with: :exception

  responders :flash
  respond_to :html

  expose :serialized_current_user_data, -> { serialized_current_user_data }

  private

  def serialized_current_user_data
    return nil unless user_signed_in?

    UserSerializer.new(current_user).to_json
  end
end
