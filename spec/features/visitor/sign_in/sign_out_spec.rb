require 'rails_helper'

feature 'Sign out' do
  let(:user) { create :user, :confirmed }

  before(:each) do
    sign_in(user.email, '123456')
  end

  scenario 'Logged in user signs out' do
    click_link 'Sign out'

    expect(page).to have_content('Sign in')
  end
end
