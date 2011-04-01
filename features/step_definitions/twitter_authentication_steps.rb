Given /^the Twitter OAuth request is successful$/ do
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = {
    'provider' => 'twitter',
    'uid' => 1,
    'user_info' => {'name' => 'John Smith'}
  }
end

Given /^I am logged in with Twitter account$/ do
  Given %Q{the Twitter OAuth request is successful}
  When %Q{I go to the sign in page}
  When %Q{I follow "Twitter"}
  Then %Q{I should be signed in}
end
