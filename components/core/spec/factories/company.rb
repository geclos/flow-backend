FactoryBot.define do
  factory :company, class: Core::Company do
    name {'Acme. Inc.'}
    country {'es'}
    sector {'information_technology'}
    size {'large'}
  end
end
