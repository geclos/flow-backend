class SignupNotifierPreview < ::ActionMailer::Preview
  def confirm
    Notifications::SignupNotifier.confirm(Signup.first)
  end
end
