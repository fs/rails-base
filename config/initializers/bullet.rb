Rails.application.config.after_initialize do
  Bullet.enable = true
  Bullet.alert = true
  Bullet.rails_logger = true
  Bullet.console = true
end if defined?(Bullet)
