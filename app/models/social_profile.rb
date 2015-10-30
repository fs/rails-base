class SocialProfile < ActiveRecord::Base
  PROVIDERS = %i(facebook google_oauth2)

  belongs_to :user

  validates :user, :provider, :uid, presence: true
  validates :uid, uniqueness: { scope: :provider }

  def self.from_omniauth(auth)
    find_by(provider: auth.provider, uid: auth.uid)
  end
end
