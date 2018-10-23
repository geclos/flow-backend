FactoryBot.define do
  factory :user do
    first_name {'Paco'}
    last_name {'Merlo'}
    email {'paco@merlo.com'}
    confirmed_at {Date.today - 1.year}
    confirmation_sent_at {Date.today - 1.year}

    company
  end
end
