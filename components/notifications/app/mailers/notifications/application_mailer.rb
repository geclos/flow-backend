module Notifications
  class ApplicationMailer < ActionMailer::Base
    default from: 'iFlow <hello@mg.iflowframework.com>'
    layout 'notifications/layouts/mailer'
  end
end
