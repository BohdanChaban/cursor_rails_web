# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :user_name => 'fckl2009',
    :password => '19911963rfhgfnb',
    :domain => 'https://morning-caverns-29306.herokuapp.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}