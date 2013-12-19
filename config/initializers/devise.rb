Devise.setup do |config|
  config.secret_key = 'f6b0c8d9309740b4e7d05b9dfd1047616acc4dc12b19125b78a37c929002408acc35a86fcff4b0fba15f11b12f619b2b47c3a1d1c899a85e22e350341f19bf63'

  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [ :email ]

  config.strip_whitespace_keys = [ :email ]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = true

  config.password_length = 8..128

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete
end
