module Core
  class CampaignsCollection < ::ApplicationCollection
    def filter
      coll = scope_by_tenant
      coll
    end

    private

    def scope_by_tenant
      Campaign.where(company_id: current_user.company_id)
    end
  end
end
