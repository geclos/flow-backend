module Core
  class CampaignMembersController < ApplicationController
    before_action :fetch_user, only: [:update, :destroy]

    def index
      result = campaign_members.map do |user|
        CampaignMemberPresenter.new(user).serialize
      end.to_json

      render json: result
    end

    private

    def campaign_members
      CampaignMembersCollection.new(current_user).filter
    end
  end
end
