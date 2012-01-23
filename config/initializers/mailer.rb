ActionMailer::Base.default_url_options[:host] = configatron.host

# Heroku specific setting for Cedar stack http://devcenter.heroku.com/articles/sendgrid#usage
# heroku addons:add sendgrid:starter
#
# ActionMailer::Base.smtp_settings = {
#   :address        => 'smtp.sendgrid.net',
#   :port           => '587',
#   :authentication => :plain,
#   :user_name      => ENV['SENDGRID_USERNAME'],
#   :password       => ENV['SENDGRID_PASSWORD'],
#   :domain         => 'heroku.com'
# }
# ActionMailer::Base.delivery_method = :smtp
