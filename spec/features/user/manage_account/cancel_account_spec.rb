require 'rails_helper'

feature 'Cancel account' do
  let(:user) { create :user, :confirmed }

  let(:login_page) { Devise::Sessions::New.new }
  let(:edit_user_page) { Devise::Registrations::Edit.new }

  before(:each) do
    login_page.load
    login_page.sign_in(user.email, '123456')
  end

  scenario 'I cancel my account' do
    edit_user_page.load
    edit_user_page.cancel_account

    expect(edit_user_page.top_bar).to have_sign_in_link
    expect(edit_user_page).to have_cancel_account_notice

    login_page.sign_in(user.email, '123456')
    expect(login_page).to have_invalid_credentials_alert
  end
end
