def submit_update_account_form(fields)
  visit edit_user_registration_path

  keys = %i(full_name email password password_confirmation current_password)

  keys.each do |key|
    fill_in("user_#{key}", with: fields[key]) unless fields[key].blank?
  end

  click_button 'Update'
end

step 'I cancel my account' do
  visit edit_user_registration_path
  click_link 'Cancel my account'
end

step 'I submit update account form with valid data but with wrong current password' do
  submit_update_account_form(
    full_name: 'My new name with invalid password',
    email: @current_user.email,
    password: '123456',
    password_confirmation: '123456',
    current_password: 'invalid password'
  )
end

step 'I submit update account form with valid data' do
  submit_update_account_form(
    full_name: 'My new name',
    email: @current_user.email,
    password: '123456',
    password_confirmation: '123456',
    current_password: '123456'
  )
end

step 'my account should not exists' do
  User.exists?(@current_user.id).should be_false
end

step 'my account should be updated successfully' do
  @current_user.reload
  @current_user.full_name.should eql 'My new name'
end

step 'my account should not be updated' do
  @current_user.reload
  @current_user.full_name.should_not eql 'My new name with invalid password'
end
