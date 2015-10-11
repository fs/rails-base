module Users
  class RegistrationsController < Devise::RegistrationsController
    expose(:social_profiles) { current_user.social_profiles if current_user }

    def create
      super
      session[:omniauth] = nil unless @user.new_record?
    end

    private

    def build_resource(*args)
      super
      @user.apply_omniauth(session[:omniauth]) if session[:omniauth]
    end
  end
end
