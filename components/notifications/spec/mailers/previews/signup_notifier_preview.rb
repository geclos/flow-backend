class SignupNotifierPreview < ::ActionMailer::Preview
  def confirm
    signup = Signup.new(
      first_name: 'Paco',
      last_name: 'Merlo',
      email: 'paco@merlo.com'
    )

    Notifications::SignupNotifier.confirm(signup)
  end
end
