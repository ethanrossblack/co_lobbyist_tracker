FactoryBot.define do
  factory :bill do
    bill_num { "SB24-001" }
    title { "Sample Bill" }
    fiscal_year { "2023-2024" }
  end
end
