require 'spec_helper'

feature 'Sign up' do
  let(:email) { 'chuck.norris@example.com' }

  before do
    register(
      full_name: 'Chuck Norris',
      email: email,
      password: '123456'
    )
  end

  scenario 'User signs up successfully' do
    open_email email

    expect(current_email).to have_subject 'Confirmation instructions'
    expect(current_email.default_part_body.to_s).to match(/Chuck Norris/)
  end

  scenario 'User confirms account' do
    visit new_user_confirmation_path

    fill_in 'user_email', with: email
    click_button 'Resend confirmation instructions'

    open_email email
    visit_in_email 'Confirm my account'

    expect(User.find_by_email(email)).to be_confirmed

    within '.top-bar' do
      expect(page).to have_content 'Sign out'
    end
  end
end
