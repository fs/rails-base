class User < ApplicationRecord
  include AvatarUploader::Attachment(:avatar)

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  validates :full_name, presence: true
end
