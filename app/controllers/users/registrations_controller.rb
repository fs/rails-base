module Users
  class RegistrationsController < Devise::RegistrationsController
    expose(:social_profiles) { current_user.social_profiles if current_user }
  end
end
