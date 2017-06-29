class ApplicationMailer < ActionMailer::Base
  default from: "#{ENV['SMTP_FROM_NAME']} <#{ENV['SMTP_FROM_EMAIL']}>"
  layout "mailer"

  def helpers
    ActionController::Base.helpers
  end
end
