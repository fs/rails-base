require 'spec_helper'

feature 'Sign in' do
  let(:user) { create :user, :confirmed }

  scenario 'User signs in successfully' do
    sign_in user.email, '123456'

    within '.top-bar' do
      expect(page).to have_content 'Sign out'
    end
  end

  # scenario 'User signs in with invalid credentials' do
  #   sign_in_with 'empty@email.com', 'empty password'

  #   within '.top-bar' do
  #     expect(page).to have_content 'Sign in'
  #   end
  # end

  # scenario 'User has not confirmed email address' do
  #   user.update(confirmed_at: nil)

  #   sign_in_with user.email, '123456'

  #   expect(page).to have_content 'You have to confirm your account before continuing'
  # end

  # scenario 'User forgets his password' do
  #   visit new_user_password_path

  #   fill_in 'Enter your email address', with: user.email
  #   click_button 'Send me reset password instructions'

  #   open_email(user.email)

  #   expect(current_email).to have_subject 'Reset password instructions'
  #   expect(current_email.default_part_body.to_s).to match(/#{user.full_name}/)
  # end
end
