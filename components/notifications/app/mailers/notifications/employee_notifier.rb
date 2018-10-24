module Notifications
  class EmployeeNotifier < ApplicationMailer
    # @param sender [User]
    # @param sendee [Employee]
    def poll(sender, sendee)
      @sender = sender
      @sendee = sendee
      mail(
        to: sendee.user.email,
        host: ENV['APP_DOMAIN'],
        locale: I18n.locale,
        subject: t(
          'employee_notifier.poll.subject',
          sender: sender.full_name
        )
      )
    end
  end
end
