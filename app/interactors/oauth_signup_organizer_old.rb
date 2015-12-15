class OauthSignupOrganizerOld
  attr_reader :auth
  private :auth

  def initialize(auth)
    @auth = auth
  end

  def call
    if auth_verified?
      if user_found_by_uid.present?
        if user_found_by_uid.confirmed?
          user_found_by_uid.sign_in # pseudocode
        else
          user_found_by_uid.reset_password(new_password, new_password)
          user_found_by_uid.confirm!
          user_found_by_uid.sign_in
          redirect_to finish_signup_page_path # pseudocode
        end
      else
        if user_found_by_email.present?
          if user_found_by_email.confirmed?
            create_social_profile(user_found_by_email)
            user_found_by_email.sign_in
          else
            user_found_by_email.sign_in
            create_social_profile(user_found_by_email)
            user_found_by_email.reset_password(new_password, new_password)
            user_found_by_email.confirm!
            redirect_to finish_signup_page_path # pseudocode
          end
        else
          create_confirmed_user
        end
      end
    else
      if user_found_by_uid.present?
        user_found_by_uid.sign_in
        user_found_by_uid.send_confirmation_instructions unless user_found_by_uid.confirmed?
      else
        if user_found_by_email.present?
          "Alert: Please, connect your account from profile page"
        else
          create_new_user
          user_found_by_uid.send_confirmation_instructions
        end
      end
    end
  end

  private

  def auth_verified?
    AuthVerificationPolicy.new(auth).verified?
  end

  def user_found_by_uid
    @user_found_by_uid ||= SocialProfile.from_omniauth(auth).try(:user)
  end

  def user_found_by_email
    @user_found_by_email ||= User.find_by(email: auth["info"]["email"])
  end

  def create_social_profile(user)
    user.apply_omniauth(auth) && user.save!
  end

  def create_confirmed_user
    user = User.new
    user.email = auth["info"]["email"]
    user.full_name = auth["info"]["name"]
    user.reset_password(new_password, new_password)
    user.confirm!
    redirect_to finish_signup_page_path # pseudocode
  end

  def create_new_user
    user = User.new
    user.email = auth["info"]["email"]
    user.full_name = auth["info"]["name"]
    user.reset_password(new_password, new_password)
    redirect_to finish_signup_page_path # pseudocode
  end

  def new_password
    @new_password ||= Devise.friendly_token.first(8)
  end
end
