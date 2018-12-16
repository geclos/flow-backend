require 'rails_helper'

RSpec.describe Core::CampaignMemberInteractor::Create do
  let(:campaign) { create(:campaign) }
  let(:employee) { create(:employee) }
  let(:params) { {} }
  let(:interactor) do
    described_class.new(params: params)
  end

  describe 'class' do
    context 'with good params' do
      let(:poll_token) { nil }
      let(:params) { {
        poll_token: poll_token,
        employee_id: employee.id,
        campaign_id: campaign.id
      } }

      context 'with poll token' do
        let(:poll_token) { 'foo' }

        it "creates a campaign member" do
          result = interactor.call
          expect(result).to be_instance_of(Core::CampaignMember)
          expect(interactor.call.attributes).to include({
            "employee_id" => params[:employee_id],
            "campaign_id" => params[:campaign_id],
            "poll_token" => params[:poll_token]
          })
        end
      end

      context 'without poll token' do
        it "creates a campaign member" do
          result = interactor.call
          expect(result).to be_instance_of(Core::CampaignMember)
          expect(interactor.call.attributes).to include({
            "employee_id" => params[:employee_id],
            "campaign_id" => params[:campaign_id]
          })
        end
      end
    end

    context 'with bad params' do
      let(:params) { {
        employee_id: employee.id
      } }

      it "fails to create campaign" do
        expect { interactor.call }.to raise_error ActiveRecord::RecordInvalid
      end
    end
  end
end
