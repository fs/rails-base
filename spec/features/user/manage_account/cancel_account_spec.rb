require 'spec_helper'

feature 'Cancel account' do
  let(:user) { create :user, :confirmed }
  let(:login_page) { LoginPage.new }
  let(:edit_user_page) { EditUserPage.new }

  before do
    login_page.visit_page.sign_in(user.email, '123456')
  end

  scenario 'I cancel my account' do
    edit_user_page.visit_page.cancel_account

    expect(User.exists?(user.id)).to be_falsey
  end
end
