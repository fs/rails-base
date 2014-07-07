require 'spec_helper'

feature 'Update account with valid data' do
  let(:user) { create :user, :confirmed }
  let(:edit_user_page) { EditUserPage.new }

  before do
    edit_user_page.load
    edit_user_page.top_bar.sign_in(user.email, '123456')
  end

  scenario 'I submit update account form with valid data' do
    edit_user_page.update_account_form(
      full_name: 'New Name',
      email: user.email,
      password: '123456',
      password_confirmation: '123456',
      current_password: '123456'
    )

    expect(user.reload.full_name).to eql 'New Name'
  end
end
