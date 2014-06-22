require 'spec_helper'
require 'support/sessions_helper'

feature 'Update account with invalid data' do
  before do
    @current_user = create :user, :confirmed
    sign_in_with @current_user.email, '123456'
  end

  scenario 'I submit update account form with wrong current password' do
    submit_update_account_form(
      full_name: 'My new name with invalid password',
      email: @current_user.email,
      password: '123456',
      password_confirmation: '123456',
      current_password: 'invalid password'
    )
  end

  scenario 'my account should not be updated' do
    @current_user.reload
    expect(@current_user.full_name).to_not eql 'My new name with invalid password'
  end
end
