def submit_update_account_form(fields)
  visit edit_user_registration_path

  fields.each do |key, value|
    fill_in("user_#{key}", with: value)
  end

  click_button 'Update'
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

step 'my account should be updated successfully' do
  @current_user.reload
  expect(@current_user.full_name).to eql 'My new name'
end
