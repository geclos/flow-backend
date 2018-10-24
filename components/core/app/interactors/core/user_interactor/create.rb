module Core
  module UserInteractor
    class Create
      def initialize(params:)
        @params = params
      end

      def call
        User.create! @params
      end
    end
  end
end
