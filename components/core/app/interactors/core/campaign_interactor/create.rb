module Core
  module CampaignInteractor
    class Create
      def initialize(params:)
        @params = params
      end

      def call
        Campaign.create! @params
      end
    end
  end
end
