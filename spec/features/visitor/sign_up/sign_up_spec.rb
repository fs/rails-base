require 'spec_helper'
require 'support/sessions_helper'

feature 'Sign up' do

  before do
    register
  end

  scenario 'I submit registration form and follow registration confirmation link in the email' do
    open_email 'chuck.norris@example.com'
    visit_in_email 'Confirm my account'
    expect(User.find_by_email('chuck.norris@example.com')).to be_confirmed
  end

  scenario 'I submit resent confirmation instruction form' do

    visit new_user_confirmation_path

    fill_in 'user_email', with: 'chuck.norris@example.com'
    click_button 'Resend confirmation instructions'
  end

  scenario 'I should receive registration confirmation email' do
    open_email 'chuck.norris@example.com'

    expect(current_email).to have_subject 'Confirmation instructions'
    expect(current_email.default_part_body.to_s).to match(/Chuck Norris/)
  end

end
