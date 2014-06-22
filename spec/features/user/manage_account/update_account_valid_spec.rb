require 'spec_helper'
require 'support/sessions_helper'

feature 'Update account with valid data' do

  before do
    @current_user = create :user, :confirmed
    sign_in_with @current_user.email, '123456'
  end

  scenario 'I submit update account form with valid data' do
    submit_update_account_form(
      full_name: 'John Smith',
      email: @current_user.email,
      password: '123456',
      password_confirmation: '123456',
      current_password: '123456'
    )
  end

  scenario 'my account should be updated successfully' do
    @current_user.reload
    expect(@current_user.full_name).to eql 'John Smith'
  end
end
