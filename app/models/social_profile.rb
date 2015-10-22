class SocialProfile < ActiveRecord::Base
  PROVIDERS = %i(facebook google_oauth2)

  belongs_to :user

  validates :user, :provider, :uid, presence: true
  validates :uid, uniqueness: { scope: :provider }

  def self.from_omniauth(auth)
    find_by(provider: auth.provider, uid: auth.uid)
  end

  def self.find_for_oauth(auth)
    find_or_create_by(uid: auth.uid, provider: auth.provider)
  end
end
