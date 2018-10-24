module Core
  module EmployeeInteractor
    class BulkCreate
      def initialize(company:, emails:)
        @emails = emails
        @company = company
      end

      def call
        @emails.each do |email|
          ActiveRecord::Base.transaction do
            user = UserInteractor::Create.new(
              params: {
                company_id: @company.id,
                email: email
              }
            ).call

            employee = EmployeeInteractor::Create.new(
              params: {
                user_id: user.id
              }
            ).call

            send_poll_email!(employee)
          end
        end
      end

      private

      def send_poll_email!(employee)
        ::Notifications::EmployeeNotifier.poll(employee).deliver_later!
      end
    end
  end
end
