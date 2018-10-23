module Core
  module EmployeeInteractor
    class Delete
      def initialize(employee:)
        @employee = employee
      end

      def call
        employee.destroy!
      end
    end
  end
end
