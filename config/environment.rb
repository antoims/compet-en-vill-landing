# Load the Rails application.
require_relative "application"

## sendgrid

# ActionMailer::Base.smtp_settings = {
#   user_name: 'apikey', # This is the string literal 'apikey', NOT the ID of your API key
#   password: ENV['SENDGRID_API_KEY'], # This is the secret sendgrid API key which was issued during API key creation
#   domain: 'yourdomain.com',
#   address: 'smtp.sendgrid.net',
#   port: 587,
#   authentication: :plain,
#   enable_starttls_auto: true
# }


Rails.application.configure do
  ## Sendinblue
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'smtp-relay.sendinblue.com',
    port: 587,
    user_name: ENV['SENDINBLUE_EMAIL'],
    password: ENV['SENDINBLUE_PASSWORD'],
    authentication: 'login',
    enable_starttls_auto:true
  }
end

# Initialize the Rails application.
Rails.application.initialize!
