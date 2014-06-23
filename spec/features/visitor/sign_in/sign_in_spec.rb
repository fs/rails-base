require 'spec_helper'
require 'support/sessions_helper'



feature 'Sign in' do
  before do
    @current_user = create :user, :confirmed
  end

  scenario 'I exist as a user with confirmed email' do
      expect(User.find_by_email(@current_user.email)).to be_confirmed
  end

  scenario 'I sign in with valid credentials' do
    sign_in_with @current_user.email, '123456'
  end

  scenario 'I sign in with invalid credentials' do
    sign_in_with 'empty@email.com', 'empty password'
    expect(page).to have_content 'Invalid email or password.'
  end

  scenario 'I should see that my email is not confirmed' do
    @current_user2 = create :user, :not_confirmed
    sign_in_with @current_user2.email, '123456'

    expect(page).to have_content 'You have to confirm your account before continuing'
  end

  scenario 'I should receive reset password instructions email' do
    visit new_user_password_path

    fill_in 'Enter your email address', with: @current_user.email
    click_button 'Send me reset password instructions'

    open_email(@current_user.email)

    expect(current_email).to have_subject 'Reset password instructions'
    expect(current_email.default_part_body.to_s).to match(/#{@current_user.full_name}/)
  end
end

