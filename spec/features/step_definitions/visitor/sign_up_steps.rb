def register
  visit new_user_registration_path

  fill_in 'user_full_name', with: 'Chuck Norris'
  fill_in 'user_email', with: 'chuck.norris@example.com'
  fill_in 'user_password', with: '123456'
  fill_in 'user_password_confirmation', with: '123456'

  click_button 'Sign up'
end

step 'I have email with confirmation link' do
  register
end

step 'I submit registration form with required fields' do
  register
end

step 'I follow registration confirmation link in the email' do
  open_email 'chuck.norris@example.com'
  visit_in_email 'Confirm my account'
end

step 'I submit resent confirmation instruction form' do
  create(
    :user,
    :not_confirmed,
    email: 'chuck.norris@example.com',
    full_name: 'Chuck Norris'
  )

  visit new_user_confirmation_path

  fill_in 'user_email', with: 'chuck.norris@example.com'
  click_button 'Resend confirmation instructions'
end

step 'I should receive registration confirmation email' do
  open_email 'chuck.norris@example.com'

  expect(current_email).to have_subject 'Confirmation instructions'
  expect(current_email.default_part_body.to_s).to match(/Chuck Norris/)
end

step 'my account should be confirmed' do
  expect(User.find_by_email('chuck.norris@example.com')).to be_confirmed
end
