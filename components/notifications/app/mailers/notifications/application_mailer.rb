module Notifications
  class ApplicationMailer < ActionMailer::Base
    default from: 'hello@flow.com'
    layout 'notifications/layouts/mailer'
  end
end
