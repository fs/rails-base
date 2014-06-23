require 'spec_helper'

feature 'Update account with valid data' do
  let(:user) { create :user, :confirmed }

  before do
    sign_in_with user.email, '123456'
  end

  scenario 'I submit update account form with valid data' do
    submit_update_account_form(
      full_name: 'New Name',
      email: user.email,
      password: '123456',
      password_confirmation: '123456',
      current_password: '123456'
    )

    expect(user.reload.full_name).to eql 'New Name'
  end
end
