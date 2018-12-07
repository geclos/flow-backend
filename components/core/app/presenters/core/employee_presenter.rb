module Core
  class EmployeePresenter < ::ItemPresenter
    def serialize
      {
        id: item.id,
        user_id: item.user_id
      }
    end
  end
end
