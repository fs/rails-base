# allow send emails to the @example.com
#
if defined?(MailSafe::Config)
  MailSafe::Config.internal_address_definition = /^.*@example\.com$/i
end