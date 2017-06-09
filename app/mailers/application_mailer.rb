class ApplicationMailer < ActionMailer::Base
  default from: ENV['smtp_from']
  layout 'mailer'
end
