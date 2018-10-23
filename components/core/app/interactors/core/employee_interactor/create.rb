module Core
  module EmployeeInteractor
    class Create
      def initialize(employee:, params:)
        @employee = employee
        @params = params
      end

      def call
        employee.create! params
      end
    end
  end
end
