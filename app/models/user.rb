class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, omniauth_providers: SocialProfile::PROVIDERS

  validates :full_name, presence: true

  has_many :social_profiles, dependent: :destroy

  def to_s
    full_name
  end

  def full_name_with_email
    "#{self[:full_name]} (#{email})"
  end

  def self.build_from_omniauth(auth)
    new(email: auth["info"]["email"], full_name: auth["info"]["name"])
  end

  def apply_omniauth(auth)
    self.email = auth["info"]["email"] if email.blank?
    self.full_name = auth["info"]["name"] if full_name.blank?
    social_profiles.build(provider: auth["provider"], uid: auth["uid"])
  end

  def connect_social_profile(auth)
    social_profile = SocialProfile.from_omniauth(auth)

    if social_profile
      social_profile.update_attribute(:user, self)
    else
      apply_omniauth(auth) && save
    end
  end
end
