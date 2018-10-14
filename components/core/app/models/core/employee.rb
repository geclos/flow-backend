module Core
  class Employee < ApplicationRecord
    self.table_name = 'employees'

    # RELATIONS
    # :::::::::
    belongs_to :user
  end
end
