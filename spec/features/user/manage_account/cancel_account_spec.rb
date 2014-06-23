require 'spec_helper'

feature 'Cancel account' do
  let(:user) { create :user, :confirmed }

  before do
    sign_in_with user.email, '123456'
  end

  scenario 'I cancel my account' do
    visit edit_user_registration_path
    click_link 'Cancel my account'

    expect(User.exists?(user.id)).to be_falsey
  end
end

