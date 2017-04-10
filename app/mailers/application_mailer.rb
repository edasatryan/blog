class ApplicationMailer < ActionMailer::Base
  # default from: 'from@example.com'
  # layout 'mailer'
  default from: ENV['mail_from_address']
  layout 'mailer'
end
