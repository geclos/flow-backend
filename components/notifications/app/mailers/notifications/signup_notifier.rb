module Notifications
  class SignupNotifier < ApplicationMailer
    def confirm(signup)
      @signup = signup
      mail(
        to: signup.email,
        host: signup.host,
        locale: I18n.locale,
        subject: t(
          'signup_notifier.confirm.subject',
          name: signup.first_name
        )
      )
    end
  end
end
