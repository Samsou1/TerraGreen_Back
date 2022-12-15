# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  user_name: Rails.application.credentials.dig(:sendgrid, :public_key),
  password: Rails.application.credentials.dig(:sendgrid, :secret_key),
  domain: 'snipshare.dev@gmail.com',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}