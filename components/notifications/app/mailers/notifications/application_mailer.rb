module Notifications
  class ApplicationMailer < ActionMailer::Base
    default from: 'Flow <hello@mg.iflowframework.com>'
    layout 'notifications/layouts/mailer'
  end
end
