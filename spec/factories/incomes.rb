FactoryBot.define do
  factory :income do
    annual_lobbyist_registration_id { "2024#{Faker::Number.number(digits: 6)}" }
    client_name { "#{Faker::TvShows::TwinPeaks.character} #{Faker::Company.suffix} #{Faker::Company.industry}" }
    client_zip { Faker::Address.zip }
    business_type { "Fake Business" }
    industry_trade_type { "Fake Business Generation" }
    amount { Faker::Number.number(digits: 4)}
    date_received { Date.today }
    report_month { "January" }
    report_due_date { Date.today }
    fiscal_year { "2023-2024" }
  end
end
