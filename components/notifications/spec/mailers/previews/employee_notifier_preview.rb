class EmployeeNotifierPreview < ::ActionMailer::Preview
  def poll
    sender = User.new(
      email: 'paco@merlo.com',
      first_name: 'Paco',
      last_name: 'Merlo'
    )

    sendee_user = User.new(email: 'foo@bar.com')
    sendee_employee = Core::Employee.new(user: sendee_user, poll_token: SecureRandom.hex(10))

    Notifications::EmployeeNotifier.poll(sender, sendee_employee)
  end
end
