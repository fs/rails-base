if defined?(MailSafe::Config)
  # MAIL_SAFE_WHITELIST should be defined with domains deparated by '|'
  # e.g. 'flastack.com|mailsafe.com'
  #
  MailSafe::Config.internal_address_definition = /\A[^@]+@#{ENV['MAIL_SAFE_WHITELIST']}\z/

  MailSafe::Config.replacement_address = ENV['MAIL_SAFE_REPLACEMENT']
end
