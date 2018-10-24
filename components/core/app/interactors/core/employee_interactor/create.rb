module Core
  module EmployeeInteractor
    class Create
      def initialize(params:)
        @params = params
      end

      def call
        Employee.create! @params
      end
    end
  end
end
