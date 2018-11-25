module Core
  module EmployeeInteractor
    class BulkCreate
      def initialize(author:, company:, emails:)
        @author = author
        @emails = emails
        @company = company
      end

      def call
        employee = nil

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
                user_id: user.id,
                form_sent_at: Date.today # TODO: this is too optimistic, should be updated after employee has been notified.
              }
            ).call
          end

          send_poll_email!(employee)
        end
      end

      private

      def send_poll_email!(employee)
        ::Notifications::EmployeeNotifier.poll(@author, employee).deliver_later!
      end
    end
  end
end
