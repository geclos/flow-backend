class Signup < ApplicationRecord
  EMAIL_REGEX = /[^\\.\\s@:](?:[^\\s@:]*[^\\s@:\\.])?@[^\\.\\s@]+(?:\\.[^\\.\\s@]+)*/
  NAME_REGEX = /\A[^[:cntrl:]\\<>\/&]*\z/

  # CALLBACKS
  # =========
  before_create :set_confirmation_token

  # RELATIONS
  # =========
  belongs_to :user, optional: true

  # VALIDATIONS
  # ===========
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :first_name, :last_name, format: { with: NAME_REGEX }

  def set_confirmation_token
    self.confirmation_token = generate_token
  end

  def generate_token
    loop do
      token = SecureRandom.hex(10)
      break token unless Signup.where(confirmation_token: token).exists?
    end
  end
end
