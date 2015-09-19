module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      handle_callback
    end

    def facebook
      handle_callback
    end

    private

    def handle_callback
      if current_user && social_profile
        when_current_user_and_social_profile
      elsif current_user
        when_current_user
      elsif social_profile
        when_social_profile
      else
        when_first_visit
      end
    end

    def social_profile
      @social_profile ||= SocialProfile.from_omniauth(auth)
    end

    def auth
      request.env["omniauth.auth"]
    end

    def when_current_user_and_social_profile
      flash[:notice] = t "flash.when_current_user_and_social_profile"
      redirect_to edit_user_registration_url
    end

    def when_current_user
      current_user.social_profiles.create!(provider: auth.provider, uid: auth.uid)
      flash[:notice] = t "flash.when_current_user"
      redirect_to edit_user_registration_url
    end

    def when_social_profile
      flash[:notice] = t "flash.when_social_profile"
      sign_in_and_redirect(:user, social_profile.user)
    end

    def when_first_visit
      user_from_omniauth.social_profiles.create!(provider: auth.provider, uid: auth.uid)
      flash[:notice] = t "flash.when_first_visit"
      sign_in_and_redirect(:user, user_from_omniauth)
    end

    def user_from_omniauth
      @user_from_omniauth ||= User.from_omniauth(auth)
    end
  end
end
