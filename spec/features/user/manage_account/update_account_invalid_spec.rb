require 'spec_helper'

feature 'Update account with invalid data' do
  let(:user) { create :user, :confirmed }

  let(:login_page) { LoginPage.new }
  let(:edit_user_page) { EditUserPage.new }

  before(:each) do
    login_page.load
    login_page.sign_in(user.email, '123456')
  end

  scenario 'I submit update account form with wrong current password' do
    edit_user_page.load
    edit_user_page.fill_user_form_with_invalid_data(user)

    expect(user.reload.full_name).to_not eql 'My new name with invalid password'
  end
end
