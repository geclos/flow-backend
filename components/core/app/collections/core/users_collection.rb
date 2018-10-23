module Core
  class UsersCollection < ::ApplicationCollection
    def filter
      coll = scope_by_tenant
      coll
    end

    private

    def scope_by_tenant
      User.where(company: current_user.company)
    end
  end
end
