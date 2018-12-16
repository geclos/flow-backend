module Notifications
  class EmployeeNotifier < ApplicationMailer
    # @param sender [User]
    # @param employee [Employee]
    # @param poll_token [String]
    def poll(sender, employee:, poll_token:)
      @sender = sender
      @sendee = employee
      @poll_token = poll_token

      mail(
        to: @sendee.user.email,
        host: ENV['APP_DOMAIN'],
        locale: I18n.locale,
        subject: t(
          'employee_notifier.poll.subject',
          sender: @sender.full_name
        )
      )
    end
  end
end
