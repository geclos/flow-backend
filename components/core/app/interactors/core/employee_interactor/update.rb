module Core
  module EmployeeInteractor
    class Update
      def initialize(employee:, params:)
        @employee = employee
        @params = params
      end

      def call
        employee.update_attributes! params
      end
    end
  end
end
