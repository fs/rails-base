require 'spec_helper'
require 'support/sessions_helper'

feature 'Update account with invalid data' do
  before do
    @new_user = create :user, :confirmed
    sign_in_with @new_user.email, '123456'
  end

  scenario 'I submit update account form with wrong current password' do
    submit_update_account_form(
      full_name: 'My new name with invalid password',
      email: @new_user.email,
      password: '123456',
      password_confirmation: '123456',
      current_password: 'invalid password'
    )
    expect(@new_user.reload.full_name).to_not eql 'My new name with invalid password'
  end
end
