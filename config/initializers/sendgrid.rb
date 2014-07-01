# Heroku specific setting for Cedar stack http://devcenter.heroku.com/articles/sendgrid#usage
ActionMailer::Base.smtp_settings = {
  address:              'smtp.sendgrid.net',
  port:                 '587',
  authentication:       :plain,
  user_name:            app_secrets.sendgrid_username,
  password:             app_secrets.sendgrid_password,
  domain:               'heroku.com',
  enable_starttls_auto: true
} if app_secrets.sendgrid_username
