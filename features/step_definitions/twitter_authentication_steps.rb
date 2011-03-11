Given /^the Twitter OAuth request is successful$/ do
  stub_request(:any, 'https://api.twitter.com/oauth/request_token').
      to_return(:body => {:oauth_token => 'fake', :oauth_token_secret => 'fake'}.to_query)
end

Given /^I am logged in with Twitter account$/ do
  Given %Q{the Twitter OAuth request is successful}
  When %Q{I go to the sign in page}
  When %Q{I follow "Sign in with Twitter"}
  When %Q{Twitter authorizes me as registered user}
  Then %Q{I should be signed in}
end

When /^Twitter authorizes me as registered user$/ do
  stub_request(:any, 'https://api.twitter.com/oauth/access_token').
      to_return(:body => {:oauth_token => 'fake', :oauth_token_secret => 'fake', :user_id => 1}.to_query)

  stub_request(:any, 'https://api.twitter.com/1/account/verify_credentials.json').
      to_return(:body => {:id => 1, :screen_name => 'smith', :name => 'John Smith'}.to_json)

  visit(user_omniauth_callback_path(:twitter, :oauth_token => 'fake', :oauth_verifier => 'verifier'))
end
