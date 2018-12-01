class User < ApplicationRecord
  attr_accessor :password

  # CALLBACKS
  # =========
  before_save :encrypt_password
  before_create :encrypt_password

  # RELATIONS
  # =========
  belongs_to :company
  has_one :signup
  has_one :employee

  # VALIDATIONS
  # ===========
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, format: { with: Signup::NAME_REGEX }

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.encrypted_password == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def confirmed?
    !!self.confirmed_at
  end

  def full_name
    @full_name ||= first_name + ' ' + last_name
  end

  private

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
