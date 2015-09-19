class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, omniauth_providers: %i(google_oauth2 facebook)

  validates :full_name, presence: true

  has_many :social_profiles, dependent: :destroy

  def to_s
    full_name
  end

  def full_name_with_email
    "#{self[:full_name]} (#{email})"
  end

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize.tap do |user|
      user.full_name = auth.info.name
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
      user.save!
    end
  end
end
