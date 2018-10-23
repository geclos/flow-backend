module Core
  module UserInteractor
    class Delete
      def initialize(user:)
        @user = user
      end

      def call
        user.destroy!
      end
    end
  end
end
