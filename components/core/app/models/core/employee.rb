module Core
  class Employee < ApplicationRecord
    self.table_name = 'employees'

    # RELATIONS
    # :::::::::
    belongs_to :user

    # VALIDATIONS
    # :::::::::
    validates :user_id, uniqueness: true, presence: true

    def is_member?(campaign)
      campaign.employees.include? self
    end
  end
end
