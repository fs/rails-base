module User::OmniAuthExtension
  extend ActiveSupport::Concern

  included do
    has_many :identities, :class_name => 'UserIdentity', :dependent => :destroy
    devise :omniauthable
  end

  module ClassMethods
    # Find user by omniauth uid for specified provider
    # Or create new identity if user given
    #
    def find_by_identity_for(provider, uid, current_user)
      identity = UserIdentity.find_by_provider_and_uid(provider, uid)
      return identity.user if identity

      if current_user
        current_user.identities.create!(:provider => provider, :uid => uid)
        return current_user
      end

      nil
    end

    # Used by devise for initializing new User, received both params and session.
    # Builds aomniauth identity and fills user fields if omniauth data presents in the session
    #
    def new_with_session(params, session)
      super.tap do |user|
        if data = session['devise.omniauth_data']
          user.email = data['user_info']['email'] if user.email.blank? && data['user_info']['email'].present?
          user.full_name = data['user_info']['name'] if user.full_name.blank? && data['user_info']['name'].present?
          user.skip_confirmation!

          user.identities.build(
              :provider => data['provider'],
                  :uid => data['uid'])
        end
      end
    end
  end

  module InstanceMethods
    def password_required?
      (identities.empty? || !password.blank? || !password_confirmation.blank?) && super
    end

    def valid_password?(password)
      return super if password_stored?
      true
    end

    def password_stored?
      encrypted_password_was.present?
    end
  end
end