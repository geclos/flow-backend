require 'rails_helper'

RSpec.describe Core::EmployeesController do
  routes { Core::Engine.routes }

  let(:user) { create(:user) }
  let(:employee) { create(:employee, user: user) }

  describe 'GET #index' do
    let(:action) { get :index }

    before { employee }

    context 'logged_in' do
      before { session[:user_id] = user.id }
      before { action }

      it do
        json = JSON.parse(response.body)
        expect(json.length).to eq(1)
        # TODO: compare jsons
      end
    end

    context 'not logged_in' do
      before { action }

      it do
        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'PATCH #update' do
    # TODO:
  end

  describe 'DELETE #delete' do
    # TODO:
  end
end
