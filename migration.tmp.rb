class MigrateEmployeesToCampaignMembers < ActiveRecord::Migration[5.0]
  def change
    Core::Employee.find_each do |employee|
      company = employee.user.company
      campaign = company.campaigns&.first

      if campaign
        campaign_member = CampaignMemberInteractor::Create.new(
          params: {
            employee_id: employee.id,
            campaign_id: campaign.id,
            poll_token: employee.poll_token
          }
        ).call
      else
        campaign = CampaignInteractor::Create.new(
          params: {
            date: Date.today,
            company_id: company.id
          }
        ).call

        campaign_member = CampaignMemberInteractor::Create.new(
          params: {
            employee_id: employee.id,
            campaign_id: campaign.id,
            poll_token: employee.poll_token
          }
        ).call
      end
    end
  end
end
