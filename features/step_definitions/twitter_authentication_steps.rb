Given /^I have identity for Twitter authorization$/ do
  @identity = Factory.create(:twitter_identity, :user => @current_user)
  token_requests = {:oauth_token => 'fake', :oauth_token_secret => 'fake', :user_id => @identity.uid}.to_query

  stub_request(:any, 'https://api.twitter.com/oauth/request_token').
      to_return(:body => token_requests)

  stub_request(:any, 'https://api.twitter.com/oauth/access_token').
      to_return(:body => token_requests)

  stub_request(:any, 'https://api.twitter.com/1/account/verify_credentials.json').
      to_return(:body => {:id => @identity.uid}.to_json)
end

When /^Twitter authorizes me$/ do
  visit(user_omniauth_callback_path(:twitter, :oauth_token => 'fake', :oauth_verifier => 'verifier'))
end