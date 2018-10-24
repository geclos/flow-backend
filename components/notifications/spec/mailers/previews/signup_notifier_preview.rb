class SignupNotifierPreview < ::ActionMailer::Preview
  def confirm
    user = User.new(
      email: 'paco@merlo.com',
      first_name: 'Paco',
      last_name: 'Merlo'
    )

    signup = Signup.new(
      email: 'paco@merlo.com',
      first_name: 'Paco',
      last_name: 'Merlo',
      host: 'localhost:4000',
      user: user
    )


    Notifications::SignupNotifier.confirm(signup)
  end
end
