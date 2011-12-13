Given /^the Twitter OAuth request is successful$/ do
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = {
    'provider' => 'twitter',
    'uid' => 1,
    'info' => {'name' => 'John Smith'}
  }
end

Given /^I am logged in with Twitter account$/ do
  steps %Q{
    Given the Twitter OAuth request is successful
    When I go to the sign in page
    When I follow "Twitter"
    Then I should be signed in
  }
end
