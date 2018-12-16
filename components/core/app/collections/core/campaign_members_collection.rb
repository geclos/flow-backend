module Core
  class CampaignMembersCollection < ::ApplicationCollection
    def filter
      coll = scope_by_tenant
      coll
    end

    private

    def scope_by_tenant
      CampaignMember
        .joins(:campaign)
        .where(campaigns: { company_id: current_user.company_id })
    end
  end
end
