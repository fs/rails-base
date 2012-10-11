def sign_in_with(email, password)
  visit new_user_session_path

  fill_in "Email", with: email
  fill_in "Password", with: password

  click_button "Sign in"
end


step 'I exist as a user with not confirmed email' do
  @current_user = FactoryGirl.create :user, :not_confirmed
end

step 'I sign in with valid credentials' do
  sign_in_with @current_user.email, "123456"
end

step 'I sign in with invalid credentials' do
  sign_in_with "empty@email.com", "empty password"
end

step 'I sign out' do
  within ".navbar-inner" do
    click_link "Sign out"
  end
end

step 'I request new password' do
  visit new_user_password_path

  fill_in "Email", with: @current_user.email
  click_button "Send me reset password instructions"
end

step 'I should see that my email is not confirmed' do
  page.should have_content "You have to confirm your account before continuing"
end

step 'I should receive reset password instructions email' do
  open_email(@current_user.email)

  current_email.should have_subject /Reset password instructions/
  current_email.default_part_body.to_s.should =~ /#{@current_user.full_name}/
end
