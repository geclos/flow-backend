module Core
  class EmployeePresenter < ::ItemPresenter
    def serialize
      {
        id: item.id,
        user_id: item.user_id,
        form_sent_at: item.form_sent_at
      }
    end
  end
end
