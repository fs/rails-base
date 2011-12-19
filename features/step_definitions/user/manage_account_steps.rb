When /^I cancel my account$/ do
  visit edit_user_registration_path
  click_link "Cancel my account"
end

Then /^my account should not exists$/ do
  User.exists?(@current_user.id).should be_false
end