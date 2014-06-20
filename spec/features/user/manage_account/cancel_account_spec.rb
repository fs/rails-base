require 'spec_helper'

feature 'Drop account' do
  scenario 'I cancel my account' do
    visit edit_user_registration_path
    click_link 'Cancel my account'

    expect(User.exists?(@current_user.id)).to be false
  end
end
