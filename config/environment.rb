# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Githubbug::Application.initialize!

ActionMailer::Base.config do
  config.action_mailer.delivery_method = :smtp
end

ActionMailer::Base.smtp_settings = {
  :address  => "mail.winduppixel.com",
  :port  => 25,
  :user_name  => "admin@winduppixel.com",
  :password  => "K8|;;/fv*x=.W^v",
  :authentication  => :login
}
