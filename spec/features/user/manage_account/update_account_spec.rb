require 'rails_helper'

feature 'Update account with valid data' do
  let(:user) { create :user, :confirmed }

  let(:login_page) { Devise::Sessions::New.new }
  let(:edit_user_page) { Devise::Registrations::Edit.new }

  before(:each) do
    login_page.load
    login_page.sign_in(user.email, '123456')
  end

  scenario 'I submit update account form with valid data' do
    edit_user_page.load
    edit_user_page.update_user_information(full_name: 'New Name', current_password: '123456')

    expect(edit_user_page.top_bar).to have_text 'New Name'
  end

  scenario 'Wrong current password' do
    edit_user_page.load
    edit_user_page.update_user_information(full_name: 'New Name', current_password: 'wrong')

    expect(edit_user_page).to have_validation_error_alert
  end
end
