module Core
  class UserPresenter < ::ItemPresenter
    def serialize
      {
        id: item.id,
        email: item.email,
        first_name: item.first_name,
        last_name: item.last_name,
        company_id: item.company_id
      }
    end
  end
end
