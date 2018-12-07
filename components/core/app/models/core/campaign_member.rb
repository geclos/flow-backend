module Core
  class CampaignMember < ApplicationRecord
    self.table_name = 'campaign_members'

    # CALLBACKS
    # =========
    before_create :set_poll_token

    # RELATIONS
    # :::::::::
    belongs_to :campaign
    belongs_to :employee

    # VALIDATIONS
    # :::::::::
    validates :employee_id, :campaign_id, presence: true


    def set_poll_token
      return if self.poll_token

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
