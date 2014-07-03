class ResendConfirmationPage < PageObjects

  def submit_form(email)
    fill_in 'user_email', with: email

    click_button 'Resend confirmation instructions'
  end

  def visit_page
    visit('users/confirmation/new')
    self
  end
end
