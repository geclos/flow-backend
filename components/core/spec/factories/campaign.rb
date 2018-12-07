FactoryBot.define do
  factory :campaign, class: Core::Campaign do
    date { Date.today }

    company
  end
end
