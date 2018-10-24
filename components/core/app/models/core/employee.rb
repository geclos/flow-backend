module Core
  class Employee < ApplicationRecord
    self.table_name = 'employees'

    # CALLBACKS
    # =========
    before_create :set_poll_token

    # RELATIONS
    # :::::::::
    belongs_to :user

    # VALIDATIONS
    # :::::::::
    validates :user_id, uniqueness: true, presence: true

    def set_poll_token
      self.poll_token = generate_token
    end

    def generate_token
      loop do
        token = SecureRandom.hex(10)
        break token unless Employee.where(poll_token: token).exists?
      end
    end
  end
end
