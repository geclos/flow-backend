module Core
  class EmployeesCollection < ::ApplicationCollection
    def filter
      coll = scope_by_tenant
      coll
    end

    private

    def scope_by_tenant
      Employee
        .joins(:user)
        .where(users: { company_id: current_user.company_id })
    end
  end
end
