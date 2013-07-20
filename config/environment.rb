# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Embroideryshop::Application.initialize!

Embroideryshop::Application.configure do
  config.action_mailer.delivery_method = :smtp
  
  config.action_mailer.smtp_settings = {
    :address => ENV['SMTP'],
    :port => ENV['SMTP_PORT'],
    #:domain => "www.embroideryshop.com", 
    :authentication => ENV['SMTP_AUTHENTICATION'],
    :user_name => ENV['SMTP_USER'],
    :password =>  ENV['SMTP_PASSWORD'],
    :enable_starttls_auto => ENV['SMTP_STARTTLS_AUTO']  
  }
  
end
