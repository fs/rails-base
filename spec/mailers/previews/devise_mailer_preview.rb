class DeviseMailerPreview < ActionMailer::Preview
  def confirmation_instructions
    DeviseMailer.confirmation_instructions(User.first, "token", {})
  end

  def reset_password_instructions
    DeviseMailer.reset_password_instructions(User.first, "token", {})
  end
end
