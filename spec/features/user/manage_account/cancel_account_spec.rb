require 'spec_helper'
require 'support/sessions_helper'

feature 'Cancel account' do
  before do
    @current_user = create :user, :confirmed
    sign_in_with @current_user.email, '123456'
  end

  scenario 'I cancel my account' do
    visit edit_user_registration_path
    click_link 'Cancel my account'

    expect(User.exists?(@current_user.id)).to be false
  end
end

