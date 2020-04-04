Bullet.bullet_logger = true
Bullet.raise = true

RSpec.configure do |config|
  config.before do
    Bullet.start_request
  end

  config.after do
    Bullet.perform_out_of_channel_notifications if Bullet.notification?
    Bullet.end_request
  end
end
