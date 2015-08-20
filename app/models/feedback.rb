class Feedback
  include ActiveModel::Model

  attr_accessor :email, :name, :message, :phone, :user

  validates :email, :name, :message, presence: true
  validates :email, format: Devise.email_regexp

  def save
    valid?
  end
end
