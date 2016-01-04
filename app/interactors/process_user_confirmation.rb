class ProcessUserConfirmation
  attr_reader :user
  private :user

  def initialize(user)
    @user = user
  end

  def call
    user.confirm
    user.send_reset_password_instructions
  end
end
