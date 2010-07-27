require 'pickle/world'

Pickle.configure do |config|
  config.adapters = [:factory_girl]
  config.map 'I', 'myself', 'me', 'my', :to => 'user: "me"'
end
