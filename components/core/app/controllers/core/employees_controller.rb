module Core
  class EmployeesController < ApplicationController
    before_action :fetch_employee, only: [:update, :destroy]

    def index
      render json: employees.map do |employee|
        EmployeePresenter.new(employee)
      end.to_json
    end

    def update
      employee = EmployeeInteractor::Update.new(
        employee: @employee,
        params: employee_params
      ).call

      render json: EmployeePresenter.new(employee)
    rescue ActiveRecord::RecordInvalid => e
      raise_model_errors
    end

    def delete
      employee = EmployeeInteractor::Delete.new(
        employee: @employee
      ).call

      head :no_content
    rescue ActiveRecord::RecordInvalid => e
      raise_model_errors
    end

    private

    def fetch_employee
      @employee = employees.find_by id: params[:id]
    end

    def employees
      EmployeesCollection.new(current_user).filter
    end

    def raise_model_errors
      raise Exceptions::UnprocessableEntity.new(
        @employee.errors.messages
      )
    end
  end
end
