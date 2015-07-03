# Extend this module in spec/support/features/*.rb
module FeatureHelpers
end

RSpec.configure do |config|
  config.include FeatureHelpers, type: :feature
end
