class ProcessUserConfirmation
  attr_reader :user
  private :user

  def initialize(user)
    @user = user
  end

  def call
    user.reset_password(new_password, new_password)
    user.confirm
    user.send_reset_password_instructions
  end

  private

  def new_password
    @new_password ||= Devise.friendly_token.first(8)
  end
end
