module Core
  class CampaignMemberPresenter < ::ItemPresenter
    def serialize
      {
        id: item.id,
        poll_token: item.poll_token,
        employee_id: item.employee_id,
        campaign_id: item.campaign_id
      }
    end
  end
end
