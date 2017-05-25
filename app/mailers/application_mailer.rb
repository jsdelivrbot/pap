class ApplicationMailer < ActionMailer::Base
  default from: ENV['EMAIL_DEVELOPPER']
  layout 'mailer'
end
