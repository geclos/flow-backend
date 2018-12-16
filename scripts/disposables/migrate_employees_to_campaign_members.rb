ENV['RAILS_ENV'] = ENV['RAILS_ENV'] || 'production'
require File.expand_path('../../../config/environment', __FILE__)

Core::Employee.find_each do |employee|
  next if employee.campaign_memberships.count > 0

  company = employee.user.company
  campaign = company.campaigns&.first

  if campaign
    campaign_member = Core::CampaignMemberInteractor::Create.new(
      params: {
        employee_id: employee.id,
        campaign_id: campaign.id,
        poll_token: employee.poll_token
      }
    ).call
  else
    campaign = Core::CampaignInteractor::Create.new(
      params: {
        date: Date.today,
        company_id: company.id
      }
    ).call

    campaign_member = Core::CampaignMemberInteractor::Create.new(
      params: {
        employee_id: employee.id,
        campaign_id: campaign.id,
        poll_token: employee.poll_token
      }
    ).call
  end

  putc '.'
end
