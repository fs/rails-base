require 'spec_helper'
require 'support/sessions_helper'

feature 'Sign out' do
   before do
    @current_user = create :user, :confirmed
    sign_in_with @current_user.email, '123456'
  end

  scenario 'I signed in' do
    expect(page).to have_content @current_user.full_name+' ('+@current_user.email+')'
  end

  scenario 'I sign out' do
    click_link 'Sign out'
    expect(page).to have_content 'Sign in'
  end

end
