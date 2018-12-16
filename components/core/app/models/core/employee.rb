module Core
  class Employee < ApplicationRecord
    self.table_name = 'employees'

    # RELATIONS
    # :::::::::
    belongs_to :user
    has_many :memberships, class_name: 'Core::CampaignMember'

    # VALIDATIONS
    # :::::::::
    validates :user_id, uniqueness: true, presence: true

    def is_member?(campaign)
      campaign.employees.include? self
    end
  end
end
