require 'rails_helper'

RSpec.describe Core::EmployeeInteractor::BulkCreate do
  let(:user) { create(:user) }
  let(:emails) { ['foo@bar.com', 'patata@cocida.com', 'papapa@33.com'] }

  let(:interactor) {
    described_class.new(
      company: user.company,
      emails: emails
    )
  }

  describe 'call' do
    context 'with valid parameters' do
      before do
        expect(
          ::Notifications::EmployeeNotifier).to receive(:poll).exactly(3).times.and_return(double(deliver_later!: false))
      end

      before { interactor.call }

      it "should create users and employees for each email" do
        expect(User.count).to eq(4)
        expect(User.all.pluck(:email)).to include('foo@bar.com', 'patata@cocida.com', 'papapa@33.com')
        expect(Core::Employee.count).to eq(3)
        expect(Core::Employee.first.form_sent_at).to eq(Date.today)
      end
    end
  end
end
