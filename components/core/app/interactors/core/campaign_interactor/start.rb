module Core
  module CampaignInteractor
    class Start
      def initialize(author:, params:)
        @author = author
        @params = params
      end

      def call
        campaign = nil

        ActiveRecord::Base.transaction do
          campaign = CampaignInteractor::Create.new(
            params: {
              date: @params[:date],
              company: @author.company,
              revenue_in_cents: @params[:revenue_in_cents],
              number_of_patents: @params[:number_of_patents],
              growth_percentage_in_cents: @params[:growth_percentage_in_cents]
            }
          ).call

          AddEmployees.new(
            author: @author,
            campaign: campaign,
            params: { emails: @params[:emails] }
          ).call
        end

        campaign
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
