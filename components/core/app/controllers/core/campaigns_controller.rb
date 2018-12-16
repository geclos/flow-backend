module Core
  class CampaignsController < ApplicationController
    before_action :fetch_campaign, only: [:add_employees]

    def index
      result = campaigns.map do |user|
        CampaignPresenter.new(user).serialize
      end.to_json

      render json: result
    end

    def start
      campaign = CampaignInteractor::Start.new(
        author: current_user,
        params: start_params
      ).call

      head :no_content
    rescue ActiveRecord::RecordInvalid => e
      raise_error(e)
    end

    def add_employees
      CampaignInteractor::AddEmployees.new(
        author: current_user,
        campaign: @campaign,
        params: add_employees_params
      ).call

      head :no_content
    rescue ActiveRecord::RecordInvalid => e
      raise_error(e)
    end

    private

    def start_params
      params.permit(
        :date,
        :emails,
        :growth_percentage_in_cents,
        :revenue_in_cents,
        :number_of_patents
      )
    end

    def add_employees_params
      params.permit(:emails)
    end

    def campaigns
      CampaignsCollection.new(current_user).filter
    end

    def fetch_campaign
      @campaign = campaigns.find params[:id]
    end

    def raise_error(e)
      raise exceptions::UnprocessableEntity.new(
        e.messages
      )
    end
  end
end
