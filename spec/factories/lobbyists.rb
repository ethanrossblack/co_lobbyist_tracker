FactoryBot.define do
  factory :lobbyist do
    first_name { Faker::Books::Dune.title }
    last_name { Faker::Creature::Dog.name }
    middle_name { Faker::Name.middle_name }
    suffix { Faker::Name.suffix }
    name { "#{last_name}, #{first_name} #{middle_name} #{suffix}" }
    firm_name { "#{Faker::TvShows::TwinPeaks.character} #{Faker::Company.suffix} #{Faker::Company.industry}" }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.zip }
    phone { Faker::PhoneNumber.cell_phone }
    fiscal_years_registered { "2023-2024" }
    lobbyist_type { "Professional" }
    designation { ["Individual lobbyist that is not employed by a lobbying firm", "Individual lobbyist employed by a lobbying firm","Lobbying firm with 2 or more members"].sample }
    status { ["Current","Current","Current","Current","Terminated","Expired"].sample }
  end
end
