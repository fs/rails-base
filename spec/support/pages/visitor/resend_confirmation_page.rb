class ResendConfirmationPage < PageObject
  set_url new_user_confirmation_path

  def submit_form(email)
    fill_in 'user_email', with: email

    click_button 'Resend confirmation instructions'
  end
end
