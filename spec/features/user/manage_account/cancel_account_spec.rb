require 'spec_helper'

feature 'Cancel account' do
  let(:user) { create :user, :confirmed }
  let(:login_page) { LoginPage.new }
  let(:edit_user_page) { EditUserPage.new }

  before do
    edit_user_page.load
    edit_user_page.top_bar.sign_in(user.email, '123456')
  end

  scenario 'I cancel my account' do
    edit_user_page.cancel_account_link.click

    expect(User.exists?(user.id)).to be_falsey
  end
end
