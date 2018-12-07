require 'rails_helper'

RSpec.describe Core::CampaignInteractor::AddEmployees do
  let(:company) { create(:company) }
  let(:author) { create(:user, company: company, email: 'author@flow.com') }
  let(:user) { create(:user, company: company, email: 'paco@merlo.com') }
  let(:employee) { create(:employee, user: user) }
  let(:campaign) { create(:campaign) }
  let(:membership) { create(:campaign_member, employee: employee, campaign: campaign) }
  let(:params) { {
    emails: 'paco@merlo.com,hellen@flow.com'
  } }

  let(:interactor) do
    described_class.new(
      author: author,
      campaign: campaign,
      params: params
    )
  end

  describe 'call' do
    context 'with user & employee & membership' do
      before do
        author
        user
        employee
        membership
      end

      it "creates campaign, employees, users and memberships" do
        expect(User.count).to eq(2)
        expect(Core::CampaignMember.count).to eq(1)
        expect(Core::CampaignMember.first.employee).to eq(employee)
        expect(Core::CampaignMember.first.campaign).to eq(campaign)

        result = interactor.call

        expect(result).to be_instance_of(Core::Campaign)

        expect(User.count).to eq(3)
        expect(User.second.email).to eq('paco@merlo.com')
        expect(User.last.email).to eq('hellen@flow.com')
        expect(User.last.company).to eq(company)

        expect(Core::Employee.count).to eq(2)
        expect(Core::Employee.first.user).to eq(User.second)
        expect(Core::Employee.last.user).to eq(User.last)

        expect(Core::CampaignMember.count).to eq(2)
        expect(Core::CampaignMember.first.employee).to eq(Core::Employee.first)
        expect(Core::CampaignMember.last.employee).to eq(Core::Employee.last)
        expect(Core::CampaignMember.first.campaign).to eq(result)
        expect(Core::CampaignMember.last.campaign).to eq(result)
      end
    end
  end
end
