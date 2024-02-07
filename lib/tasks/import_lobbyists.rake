namespace :import_data do
  desc "load Lobbyist data from a .txt file"
  task lobbyists: :environment do
    # Fancy Loading Header
    puts "=" * 79
    puts "|" + " _    ___  ___ _____   _____ ___ _____ ___ ".center(77) + "|"
    puts "|" + "| |  / _ \\| _ ) _ ) \\ / /_ _/ __|_   _/ __|".center(77) + "|"
    puts "|" + "| |_| (_) | _ \\ _ \\\\ V / | |\\__ \\ | | \\__ \\".center(77) + "|"
    puts "|" + "|____\\___/|___/___/ |_| |___|___/ |_| |___/".center(77) + "|"
    puts "|" + " " * 77 + "|"
    puts "=".center(79, "="),""

    # Destroy previous lobbyists
    puts "* Destroying previous lobbyist data..."
    Lobbyist.destroy_all

    # Open text file of lobbyists
    puts "* Reading through lobbyist seed file ..."
    lobbyist_filepath = "db/data/prof_lobbyist_directory.txt"
    lobbyist_seeds = File.readlines(lobbyist_filepath)
    # First line of the file is the header, which looks like this:
    # lobbyistName	lobbystLastName	lobbyistFirstName	lobbyistMiddleName	lobbyistSuffix	lobbyistFirmName	lobbyistAddress	lobbyistCity	lobbyistState	lobbyistZip	primaryLobbyistID	lobbyistPhone	fiscalYearsRegistered	lobbystType	lobbyistDesignation	status	runDate
    
    # Iterate through each line in the file and create a Lobbyist object
    puts "* Creating lobbyist models...", ""

    # Fancy variables for the loading animation
    total_lobbyists = lobbyist_seeds.count - 1
    lobbyist_count = 0

    lobbyist_seeds[1..].each do |row|
      row = row.split("\t")

      Lobbyist.create(
        lobbyist_name: row[0],
        lobbyist_last_name: row[1],
        lobbyist_first_name: row[2],
        lobbyist_middle_name: row[3],
        lobbyist_suffix: row[4],
        lobbyist_firm_name: row[5],
        lobbyist_address: row[6],
        lobbyist_city: row[7],
        lobbyist_state: row[8],
        lobbyist_zip: row[9],
        primary_lobbyist_id: row[10].to_i,
        lobbyist_phone: row[11],
        fiscal_years_registered: row[12],
        lobbyist_type: row[13],
        lobbyist_designation: row[14].strip,
        status: row[15].strip
      )

      lobbyist_count += 1
      percent_done = (lobbyist_count.to_f / total_lobbyists)
      progress_bar = "=" * (percent_done * 59).round
      printf("\rLOADING: [%-59s] (%5.1f%%)", progress_bar, percent_done * 100)
    end
    puts "","","   DONE: Imported #{ActiveSupport::NumberHelper.number_to_delimited(lobbyist_count)} lobbyists.",""
  end
end
