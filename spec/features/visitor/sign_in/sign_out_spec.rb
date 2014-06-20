def sign_in_with(email, password)
  visit new_user_session_path

  fill_in 'user_email', with: email
  fill_in 'user_password', with: password

  click_button 'Sign in'
end

step 'I sign out' do
  within '.top-bar' do
    click_link 'Sign out'
  end
end

step 'I should see that I logged out' do
  expect(page).to have_content 'You need to sign in or sign up before continuing.'
end
