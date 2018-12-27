require 'rails_helper'

RSpec.describe Core::CampaignInteractor::Create do
  let(:company) { create(:company) }
  let(:params) { {} }
  let(:interactor) do
    described_class.new(params: params)
  end

  describe 'call' do
    context 'with good params' do
      let(:params) { {
        date: Date.today,
        company_id: company.id
      } }

      it "creates a campaign" do
        result = interactor.call
        expect(result).to be_instance_of(Core::Campaign)
        expect(result.attributes).to include({
          "company_id" => params[:company_id],
          "date" => params[:date]
        })
      end
    end

    context 'with bad params' do
      let(:params) { {
        date: Date.today,
        company_id: nil
      } }

      it "fails to create campaign" do
        expect { interactor.call }.to raise_error ActiveRecord::RecordInvalid
      end
    end
  end
end
