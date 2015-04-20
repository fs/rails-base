require 'rails_helper'

feature 'Sign in' do
  let(:user) { create :user, :confirmed }
  let(:not_confirmed_user) { create :user, :not_confirmed }

  scenario 'User signs in successfully' do
    sign_in(user.email, '123456')

    expect(page).to have_content('Sign out')
  end

  scenario 'User signs in with invalid credentials' do
    sign_in(user.email, 'wrong password')

    expect(page).to have_content('Sign in')
  end

  scenario 'User has not confirmed email address' do
    sign_in(not_confirmed_user.email, '123456')

    expect(page).to have_content('You have to confirm your account before continuing.')
  end

  scenario 'User forgets his password' do
    visit new_user_password_path

    fill_in 'user_email', with: user.email
    click_button 'Send me reset password instructions'

    open_email(user.email)

    expect(current_email).to have_subject 'Reset password instructions'
    expect(current_email).to have_body_text(user.full_name)
  end
end
