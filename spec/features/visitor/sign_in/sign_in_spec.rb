require 'spec_helper'

feature 'Sign in' do

  let(:user) { create :user, :confirmed }
  let(:login_page) { LoginPage.new }
  let(:forgot_password_page) { ForgotPasswordPage.new }

  before do
    visit new_user_session_path
  end

  scenario 'User signs in successfully' do
    login_page.sign_in(user.email, '123456')

    within '.top-bar' do
      expect(page).to have_content 'Sign out'
    end
  end

  scenario 'User signs in with invalid credentials' do
    login_page.sign_in('empty@email.com', 'empty password')

    within '.top-bar' do
      expect(page).to have_content 'Sign in'
    end
  end

  scenario 'User has not confirmed email address' do
    user.update(confirmed_at: nil)

    login_page.sign_in(user.email, '123456')

    expect(page).to have_content 'You have to confirm your account before continuing'
  end

  scenario 'User forgets his password' do
    click_link 'Forgot your password?'
    forgot_password_page.recover_password(user.email)

    open_email(user.email)

    expect(current_email).to have_subject 'Reset password instructions'
    expect(current_email.default_part_body.to_s).to match(/#{user.full_name}/)
  end
end
