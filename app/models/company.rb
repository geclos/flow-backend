class Company < ApplicationRecord
  # RELATIONS
  # =========
  has_many :users
  has_many :campaigns, class_name: 'Core::Campaign'
end
