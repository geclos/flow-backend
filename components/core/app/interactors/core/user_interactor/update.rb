module Core
  module UserInteractor
    class Update
      def initialize(user:, params:)
        @user = user
        @params = params
      end

      def call
        user.update_attributes! params
      end
    end
  end
end
