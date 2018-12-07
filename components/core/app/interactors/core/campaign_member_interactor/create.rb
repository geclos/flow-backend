module Core
  module CampaignMemberInteractor
    class Create
      def initialize(params:)
        @params = params
      end

      def call
        CampaignMember.create! @params
      end
    end
  end
end
