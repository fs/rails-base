class User < ActiveRecord::Base
  has_many :identities, :class_name => 'UserIdentity'

  devise :database_authenticatable, :registerable, :omniauthable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable

  attr_accessible :full_name, :email, :password, :password_confirmation
  validates :full_name, :presence => true

  def full_name_with_email
    "#{self[:full_name]} (#{email})"
  end

  def password_required?
    (identities.empty? || !password.blank?) && super
  end

  class << self
    def find_by_identity_for(provider, uid, current_user)
      identity = UserIdentity.find_by_provider_and_uid(provider, uid)
      return identity.user if identity

      if current_user
        current_user.identities.create!(:provider => provider, :uid => uid)
        return current_user
      end

      nil
    end

    # A convenience method that receives both parameters and session to
    # initialize an user. This can be used by OAuth, for example, to send
    # in the user token and be stored on initialization.
    def new_with_session(params, session)
      super.tap do |user|
        if data = session['devise.omniauth_data']
          user.email = data['user_info']['email'] if user.email.blank? && data['user_info']['email'].present?
          user.full_name = data['user_info']['name'] if user.full_name.blank? && data['user_info']['name'].present?
          user.confirmed_at = Time.now

          user.identities.build(
          :provider => data['provider'],
          :uid => data['uid'])
        end
      end
    end
  end
end
