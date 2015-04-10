require 'rails_helper'

feature 'Cancel account' do
  let(:user) { create :user, :confirmed }

  before(:each) do
    sign_in(user.email, '123456')
  end

  scenario 'I cancel my account' do
    visit edit_user_registration_path(user)
    click_link 'Cancel my account'

    expect(page).to have_content('Sign in')
    expect(page).to have_content('Bye! Your account was successfully cancelled. We hope to see you again soon.')

    visit new_user_session_path
    sign_in(user.email, '123456')

    expect(page).to have_content('Invalid email or password.')
  end
end
