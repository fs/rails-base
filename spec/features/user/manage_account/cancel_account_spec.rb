def submit_update_account_form(fields)
  visit edit_user_registration_path

  fields.each do |key, value|
    fill_in("user_#{key}", with: value)
  end

  click_button 'Update'
end

step 'I cancel my account' do
  visit edit_user_registration_path
  click_link 'Cancel my account'
end

step 'my account should not exists' do
  expect(User.exists?(@current_user.id)).to be false
end
