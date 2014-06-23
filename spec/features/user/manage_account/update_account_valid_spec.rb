require 'spec_helper'
require 'support/sessions_helper'

feature 'Update account with valid data' do

  before do
    @new_user = create :user, :confirmed
    sign_in_with @new_user.email, '123456'
  end

  scenario 'I submit update account form with valid data' do
    submit_update_account_form(
      full_name: 'New Name',
      email: @new_user.email,
      password: '123456',
      password_confirmation: '123456',
      current_password: '123456'
    )
    expect(@new_user.full_name).to eql 'New Name'
  end

end
