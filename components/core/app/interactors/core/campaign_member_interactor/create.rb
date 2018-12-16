module Core
  module CampaignMemberInteractor
    class Create
      def initialize(author:, params:)
        @author = author
        @params = params
      end

      def call
        membership = CampaignMember.create! @params
        send_poll_email!(membership)
      end

      private

      def send_poll_email!(membership)
        ::Notifications::EmployeeNotifier.poll(@author, {
          poll_token: membership.poll_token,
          employee: membership.employee
        }).deliver_later!
      end
    end
  end
end
