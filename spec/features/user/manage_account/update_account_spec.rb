require 'rails_helper'

feature 'Update account with valid data' do
  let(:user) { create :user, :confirmed }

  before(:each) do
    sign_in(user.email, '123456')
    visit edit_user_registration_path(user)
  end

  scenario 'I submit update account form with valid data' do
    fill_form(:user,
      full_name: 'New Name',
      current_password: '123456'
    )

    click_button 'Update'

    expect(page).to have_content('New Name')
  end

  scenario 'Wrong current password' do
    fill_form(:user,
      full_name: 'New Name',
      current_password: 'wrong'
    )

    click_button 'Update'

    expect(page).to have_content('is invalid')
  end
end
