require 'rails_helper'

RSpec.describe Core::CampaignInteractor::Start do
  let(:company) { create(:company) }
  let(:author) { create(:user, company: company, email: 'author@flow.com') }
  let(:user) { create(:user, company: company, email: 'paco@merlo.com') }
  let(:employee) { create(:employee, user: user) }
  let(:params) { {
    date: Date.today,
    emails: 'paco@merlo.com,hellen@flow.com'
  } }

  let(:interactor) do
    described_class.new(
      author: author,
      params: params
    )
  end

  describe 'call' do
    context 'without user' do
      it "creates a campaign, employees, users and memberships" do
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

    context 'with user' do
      before do
        author
        user
      end

      it "creates campaign, employees, users and memberships" do
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

    context 'with user & employee' do
      before do
        author
        user
        employee
      end

      it "creates campaign, employees, users and memberships" do
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
