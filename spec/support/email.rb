RSpec.configure do |config|
  config.before do
    ActionMailer::Base.deliveries.clear
  end
end
