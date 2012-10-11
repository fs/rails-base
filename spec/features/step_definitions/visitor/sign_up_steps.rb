def register
  visit new_user_registration_path

  fill_in "Full name", with: "Chuck Norris"
  fill_in "Email", with: "chuck.norris@example.com"
  fill_in "Password", with: "123456"
  fill_in "Password confirmation", with: "123456"

  click_button "Sign up"
end

step 'I have email with confirmation link' do
  register
end

step 'I submit registration form with required fields' do
  register
end

step 'I follow registration confirmation link in the email' do
  open_email "chuck.norris@example.com"
  visit_in_email "Confirm my account"
end

step 'I submit resent confirmation instruction form' do
  FactoryGirl.create :user,
    :not_confirmed,
    email: "chuck.norris@example.com",
    full_name: "Chuck Norris"

  visit new_user_confirmation_path

  fill_in "Email", with: "chuck.norris@example.com"
  click_button "Resend confirmation instructions"
end

step 'I should receive registration confirmation email' do
  open_email "chuck.norris@example.com"

  current_email.should have_subject /Confirmation instructions/
  current_email.default_part_body.to_s.should =~ /Chuck Norris/
end

step 'my account should be confirmed' do
  User.find_by_email("chuck.norris@example.com").should be_confirmed
end
