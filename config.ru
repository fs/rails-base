# This file is used by Rack-based servers to start the application.

require ::File.expand_path("../config/environment",  __FILE__)
use Rack::CanonicalHost, ENV["CANONICAL_HOST"] if ENV["CANONICAL_HOST"]

# Require authentication if password is set
use Rack::Auth::Basic, "RailsBase" do |_, password|
  ENV["AUTH_BASIC_PASS"] == password
end if ENV["AUTH_BASIC_PASS"]

run Rails.application
