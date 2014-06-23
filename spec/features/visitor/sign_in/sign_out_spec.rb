require 'spec_helper'

feature 'Sign out' do
  let(:user) { create :user, :confirmed }

  before do
    sign_in_with user.email, '123456'
  end

  scenario 'Logged in user signs out' do
    click_link 'Sign out'

    expect(page).to have_content 'Sign in'
  end
end
