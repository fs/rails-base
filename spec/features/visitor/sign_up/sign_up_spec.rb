require 'spec_helper'

feature 'Sign up' do
  let(:email) { 'username@example.com' }
  let(:login_page) { LoginPage.new }
  let(:sign_up_page) { SignUpPage.new }
  let(:resend_confirmation_page) { ResendConfirmationPage.new }

  before do
    sign_up_page.load
    sign_up_page.register(
      full_name: 'username',
      email: email,
      password: '123456'
    )
  end

  scenario 'User signs up successfully' do
    open_email(email)

    expect(current_email).to have_subject 'Confirmation instructions'
    expect(current_email.default_part_body.to_s).to match(/username/)
  end

  scenario 'User confirms account' do
    open_email(email)
    visit_in_email 'Confirm my account'

    expect(User.find_by_email(email)).to be_confirmed
  end

  scenario 'User resents email confirmation instructions' do
    resend_confirmation_page.load
    resend_confirmation_page.submit_form(email)

    open_email(email)

    expect(current_email).to have_subject 'Confirmation instructions'
    expect(current_email.default_part_body.to_s).to match(/username/)
  end
end
