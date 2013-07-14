# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Embroideryshop::Application.initialize!

Embroideryshop::Application.configure do
  config.action_mailer.delivery_method = :smtp
  
  config.action_mailer.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    #:domain => "www.embroideryshop.com", 
    :authentication => "plain",
    :user_name => "nilyas121@gmail.com",
    :password =>  "nomite123",
    :enable_starttls_auto => true 
  }
  
end
