module Core
  class CampaignPresenter < ::ItemPresenter
    def serialize
      {
        id: item.id,
        date: item.date,
        company_id: item.company_id,
        revenue_in_cents: item.revenue_in_cents,
        number_of_patents: item.number_of_patents,
        growth_percentage_in_cents: item.growth_percentage_in_cents
      }
    end
  end
end
