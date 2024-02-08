FactoryBot.define do
  factory :lobbyist do
    lobbyist_first_name { Faker::Books::Dune.title }
    lobbyist_last_name { Faker::Creature::Dog.name }
    lobbyist_middle_name { Faker::Name.middle_name }
    lobbyist_suffix { Faker::Name.suffix }
    lobbyist_name { "#{lobbyist_last_name}, #{lobbyist_first_name} #{lobbyist_middle_name} #{lobbyist_suffix}" }
    lobbyist_firm_name { "#{Faker::TvShows::TwinPeaks.character} #{Faker::Company.suffix} #{Faker::Company.industry}" }
    lobbyist_address { Faker::Address.street_address }
    lobbyist_city { Faker::Address.city }
    lobbyist_state { Faker::Address.state }
    lobbyist_zip { Faker::Address.zip }
    lobbyist_phone { Faker::PhoneNumber.cell_phone }
    fiscal_years_registered { "2023-2024" }
    lobbyist_type { "Professional" }
    lobbyist_designation { ["Individual lobbyist that is not employed by a lobbying firm", "Individual lobbyist employed by a lobbying firm","Lobbying firm with 2 or more members"].sample }
    status { ["Current","Current","Current","Current","Terminated","Expired"].sample }
  end
end
