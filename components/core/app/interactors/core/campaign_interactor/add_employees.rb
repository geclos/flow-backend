module Core
  module CampaignInteractor
    class AddEmployees
      def initialize(author:, campaign:, params:)
        @author = author
        @campaign = campaign
        @params = params
      end

      def call
        ActiveRecord::Base.transaction do
          @params[:emails].split(',').each do |email|
            user = UsersCollection.new(@author).filter.find_by email: email
            employee = user&.employee

            next @campaign if employee && employee&.is_member?(@campaign)

            if user && employee
              create_membership!(@campaign, employee)
            elsif user
              employee = create_employee!(user)
              create_membership!(@campaign, employee)
            else
              user = create_user!(email, @author.company)
              employee = create_employee!(user)
              create_membership!(@campaign, employee)
            end
          end
        end

        @campaign
      end

      private

      def create_user!(email, company)
        UserInteractor::Create.new(params: {
          email: email,
          company: company
        }).call
      end

      def create_employee!(user)
        EmployeeInteractor::Create.new(params: { user: user }).call
      end

      def create_membership!(campaign, employee)
        CampaignMemberInteractor::Create.new(
          author: @author,
          params: {
            campaign: campaign,
            employee: employee
          }
        ).call
      end
    end
  end
end
