require 'rails_helper'

feature 'Sign in' do
  let(:user) { create :user, :confirmed }
  let(:not_confirmed_user) { create :user, :not_confirmed }
  let(:password) { '123456' }

  let(:login_page) { Devise::Sessions::New.new }
  let(:forgot_password_page) { Devise::Passwords::New.new }

  before(:each) do
    login_page.load
  end

  scenario 'User signs in successfully' do
    login_page.sign_in(user.email, password)

    expect(login_page.top_bar).to have_sign_out_link
  end

  scenario 'User signs in with invalid credentials' do
    login_page.sign_in(user.email, 'wrong password')

    expect(login_page.top_bar).to have_sign_in_link
  end

  scenario 'User has not confirmed email address' do
    login_page.sign_in(not_confirmed_user.email, password)

    expect(login_page).to have_confirm_account_alert
  end

  scenario 'User forgets his password' do
    forgot_password_page.load
    forgot_password_page.recover_password(user.email)

    open_email(user.email)

    expect(current_email).to have_subject 'Reset password instructions'
    expect(current_email).to have_body_text(user.full_name)
  end
end
