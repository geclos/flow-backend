FactoryBot.define do
  factory :campaign_member, class: Core::CampaignMember do
    campaign
    employee
  end
end
