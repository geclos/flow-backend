module Notifications
  class SignupNotifier < ApplicationMailer
    def confirm(signup)
      mail(
        to: signup.email,
        name: signup.first_name,
        token: signup.confirmation_token,
        subject: t(
          'signup_notifier.confirm.subject',
          name: signup.first_name
        )
      )
    end
  end
end
