require 'rails_helper'

feature 'Sign up' do
  let(:user) { User.first }
  let(:user_attributes) { attributes_for(:user).slice(:full_name, :email, :password, :password_confirmation) }

  before(:each) do
    visit new_user_registration_path

    fill_form(:user, user_attributes)

    click_button 'Sign up'
  end

  scenario 'User signs up successfully' do
    open_email(user.email)

    expect(current_email).to have_subject 'Confirmation instructions'
    expect(current_email).to have_body_text(user.full_name)
  end

  scenario 'User confirms account' do
    open_email(user.email)
    visit_in_email 'Confirm my account'

    expect(page).to have_text(user.email)
  end

  scenario 'User resents email confirmation instructions' do
    visit new_user_confirmation_path

    fill_in 'user_email', with: user.email
    click_button 'Resend confirmation instructions'

    open_email(user.email)

    expect(current_email).to have_subject 'Confirmation instructions'
    expect(current_email).to have_body_text(user.full_name)
  end
end
