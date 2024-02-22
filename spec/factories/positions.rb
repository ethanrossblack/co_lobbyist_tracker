FactoryBot.define do
  factory :position do
    report_month { "MyString" }
    fiscal_year { "MyString" }
    position { "MyString" }
    bill { nil }
    lobbyist { nil }
    client { nil }
  end
end
