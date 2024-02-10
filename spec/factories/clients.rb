FactoryBot.define do
  factory :client do
    name { "#{Faker::TvShows::TwinPeaks.character} #{Faker::Company.suffix} #{Faker::Company.industry}" }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.zip }
    phone { Faker::PhoneNumber.cell_phone }
    industry_trade_type { "Fake Business Generation" }
    business_type { "Fake Business" }
    begin_date { Date.today }
    end_date { Date.today + 365 }
    status { ["Current","Current","Current","Current","Terminated","Expired"].sample }
    ceo_names { Faker::Name.name }
    fiscal_year { "2023-2024" }
    annual_lobbyist_registration_id { "2024#{Faker::Number.number(digits: 6)}" }
  end
end
