ActionMailer::Base.smtp_settings = {
  port: 587,
  address: "smtp.mailgun.org",
  user_name: ENV["MAILGUN_SMTP_LOGIN"],
  password: ENV["MAILGUN_SMTP_PASSWORD"],
  domain: ENV["MAILGUN_SMTP_DOMAIN"],
  authentication: :plain,
  content_type: "text/html"
}

ActionMailer::Base.delivery_method = :smtp

# Makes debugging easier
ActionMailer::Base.raise_delivery_errors = true

# Local mail emails me
# http://edgeguides.rubyonrails.org/action_mailer_basics.html#intercepting-emails
class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.to = "jmci10@hotmail.com"
    message.cc = nil
    message.bcc = nil
  end
end

# Locally, outgoing mail will be 'intercepted' by the 
# above DevelopmentMailInterceptor before going out
if Rails.env.development?
  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
end