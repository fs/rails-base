require 'webmock'
require 'webmock/cucumber'

# allow connections by default
WebMock.allow_net_connect!

Around('@webmock') do |scenario, block|
  WebMock::Config.instance.allow_net_connect = false
  block.call
  WebMock.disable_net_connect!
end