module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      if !CheckOmniauth.verified?(auth)
        when_social_profile_not_verified
      else
        handle_callback
      end
    end

    def facebook
      if !CheckOmniauth.verified?(auth)
        when_social_profile_not_verified
      else
        handle_callback
      end
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

    def when_social_profile_not_verified
      flash[:notice] = t "flash.social_profile_not_verified"
      redirect_to root_url
    end

    def when_current_user_and_social_profile
      flash[:notice] = t "flash.when_current_user_and_social_profile"
      redirect_to edit_user_registration_url
    end

    def when_current_user
      current_user.apply_omniauth(auth)
      current_user.save!
      flash[:notice] = t "flash.when_current_user"
      redirect_to edit_user_registration_url
    end

    def when_social_profile
      flash[:notice] = t "flash.when_social_profile"
      sign_in_and_redirect(:user, social_profile.user)
    end

    # rubocop:disable Metrics/AbcSize
    def when_first_visit
      user.apply_omniauth(auth)
      if user.save
        flash[:notice] = t "flash.when_first_visit"
        sign_in_and_redirect(:user, user)
      else
        session[:omniauth] = auth.except("extra")
        redirect_to new_user_registration_url
      end
    end
    # rubocop:enable Metrics/AbcSize

    def user
      @user ||= User.from_omniauth(auth)
    end
  end
end
