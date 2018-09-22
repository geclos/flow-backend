module Notifications
  class SignupNotifier < ApplicationMailer
    def confirm(signup)
      @signup = signup
      mail(
        to: signup.email,
        subject: t(
          'signup_notifier.confirm.subject',
          name: signup.first_name
        )
      )
    end
  end
end
