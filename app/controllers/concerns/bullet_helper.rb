module BulletHelper
  def skip_bullet
    return unless defined?(Bullet)
    return unless Bullet.enable?

    # Can't use `Bullet.enable=` b/c it's resets settings
    # https://github.com/flyerhzm/bullet/blob/master/lib/bullet.rb#L48-L58
    Bullet.instance_variable_set :@enable, false

    yield
  ensure
    Bullet.instance_variable_set :@enable, true
  end
end
