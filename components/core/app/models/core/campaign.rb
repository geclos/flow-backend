module Core
  class Campaign < ApplicationRecord
    self.table_name = 'campaigns'

    # RELATIONS
    # :::::::::
    belongs_to :company
    has_many :memberships, class_name: 'Core::CampaignMember'

    # VALIDATIONS
    # :::::::::
    validates :company_id, :date, presence: true
    validates :date, uniqueness: { scope: :company }

    def employees
      Employee.where(id: memberships.pluck(:employee_id))
    end
  end
end
