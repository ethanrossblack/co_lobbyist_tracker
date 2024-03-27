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
    lobbyist_filepath = "db/data/03_13_prof_lobbyist_directory.txt"
    lobbyist_seeds = File.readlines(lobbyist_filepath)
    # First line of the file is the header, which looks like this:
    # 0.lobbyistName	1.lobbystLastName	2.lobbyistFirstName	3.lobbyistMiddleName	4.lobbyistSuffix	5.lobbyistFirmName	6.lobbyistAddress	7.lobbyistCity	8.lobbyistState	9.lobbyistZip	10.primaryLobbyistID	11.lobbyistPhone	12.fiscalYearsRegistered	13.registrationEndDate 14.lobbystType	15.lobbyistDesignation	16.status	17.runDate
    
    # Iterate through each line in the file and create a Lobbyist object
    puts "* Creating lobbyist models...", ""

    # Fancy variables for the loading animation
    total_lobbyists = lobbyist_seeds.count - 1
    lobbyist_count = 0

    lobbyist_seeds[1..].each do |row|
      row = row.split("\t")

      Lobbyist.create(
        name: row[0],
        last_name: row[1],
        first_name: row[2],
        middle_name: row[3],
        suffix: row[4],
        firm_name: row[5],
        address: row[6],
        city: row[7],
        state: row[8],
        zip: row[9],
        id: row[10].to_i,
        phone: row[11],
        fiscal_years_registered: row[12],
        lobbyist_type: row[14],
        designation: row[15].strip,
        status: row[16].strip
      )

      lobbyist_count += 1
      percent_done = (lobbyist_count.to_f / total_lobbyists)
      progress_bar = "=" * (percent_done * 59).round
      printf("\rLOADING: [%-59s] (%5.1f%%)", progress_bar, percent_done * 100)
    end
    puts "","","   DONE: Imported #{ActiveSupport::NumberHelper.number_to_delimited(lobbyist_count)} lobbyists.",""
  end

  desc "load Client data from a .txt file"
  task clients: :environment do
    # Not as Fancy Loading Header
    puts "=" * 79
    puts "|" + " CLIENTS ".center(77) + "|"
    puts "=".center(79, "="),""

    # Destroy previous clients
    puts "* Destroying previous client data..."
    Client.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!('clients')

    # Open text file of clients
    puts "* Reading through lobbyist seed file ..."
    clients_filepath = "db/data/03_13_prof_clients_current_fiscal_year.txt"
    client_seeds = File.readlines(clients_filepath)

    # First line of the file is the header, which looks like this:
    # lobbyistName	lobbyistLastName	lobbyistFirstName	lobbyistFirmName	lobbyistZip	primaryLobbyistID	annualLobbyistRegistrationID	clientName	clientAdress	clientCity	clientState	clientZip	clientPhone	industryTradeType	businessType	clientBeginDate	clientEndDate	clientStatus	ceoNames	fiscalYear	runDate
    
    # Iterate through each line in the file and create a Lobbyist object
    puts "* Creating client models...", ""

    # Fancy variables for the loading animation
    total_clients = client_seeds.count - 1
    client_count = 0
    error_count = 0
    
    client_seeds[1..].each do |row|
      row = row.split("\t")

      begin
        Client.create!(
          name: row[7],
          address: row[8],
          city: row[9],
          state: row[10],
          zip: row[11],
          phone: row[12],
          industry_trade_type: row[13],
          business_type: row[14],
          begin_date: Date.strptime(row[15], '%m/%d/%Y'),
          end_date:  row[16] != "" ? Date.strptime(row[16], '%m/%d/%Y') : nil,
          status: row[17].strip,
          ceo_names: row[18],
          fiscal_year: row[19],
          annual_lobbyist_registration_id: row[6],
          lobbyist_id: row[5]
        )
      rescue
        error_count += 1
        puts "\n","ERROR IMPORTING #{row[7]}\nLOBBYIST: #{row[0]}\nSTART DATE: #{row[15]}\nLOBBYIST ID: #{row[5]}", ""
      end

      client_count += 1
      percent_done = (client_count.to_f / total_clients)
      progress_bar = "=" * (percent_done * 59).round
      printf("\rLOADING: [%-59s] (%5.1f%%)", progress_bar, percent_done * 100)
    end
    puts "","","   DONE: Imported #{ActiveSupport::NumberHelper.number_to_delimited(client_count)} clients. (#{error_count} errors)",""
  end

  desc "load Income data from a .txt file"
  task incomes: :environment do
    # Not as Fancy Loading Header
    puts "=" * 79
    puts "|" + " INCOMES ".center(77) + "|"
    puts "=".center(79, "="),""

    # Destroy previous 
    puts "* Destroying previous income data..."
    Income.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!('incomes')


    # Open text file of incomes
    puts "* Reading through lobbyist seed file ..."
    incomes_filepath = "db/data/03_13_prof_income_current_fiscal_year.txt"
    income_seeds = File.readlines(incomes_filepath)

    # First line of the file is the header, which looks like this:
    # lobbyistName	lobbyistLastName	lobbyistFirstName	lobbystFirmName	lobbyistZip	primaryLobbyistID	annualLobbyistRegistrationId	clientName	clientZip	businessType	industryTradeType	incomeAmount	dateIncomeReceived	reportMonth	reportDueDate	fiscalYear	runDate
    
    # Iterate through each line in the file and create a Lobbyist object
    puts "* Creating income models...", ""

    # Fancy variables for the loading animation
    total_incomes = income_seeds.count - 1
    income_count = 0

    income_seeds[1..].each do |row|
      row = row.split("\t")

      lobbyist = Lobbyist.find(row[5]) # primary ID
      client_name = row[7]
      possible_client = lobbyist.clients.where(name: client_name)

      amount = row[11].gsub(",","").to_i
      
      if possible_client.length == 0 || possible_client.length >= 3
        require "pry"; binding.pry
      else
        Income.create!(
          annual_lobbyist_registration_id: row[6],
          client_name: row[7],
          client_zip: row[8],
          business_type: row[9],
          industry_trade_type: row[10],
          amount: amount,
          date_received: Date.strptime(row[12], '%m/%d/%Y'),
          report_month: row[13],
          report_due_date: Date.strptime(row[14], '%m/%d/%Y'),
          fiscal_year: row[15],
          lobbyist_id: row[5],
          client_id: possible_client.first.id
        )
      end
      
      income_count += 1
      percent_done = (income_count.to_f / total_incomes)
      progress_bar = "=" * (percent_done * 59).round
      printf("\rLOADING: [%-59s] (%5.1f%%)", progress_bar, percent_done * 100)
    end
    puts "","","   DONE: Imported #{ActiveSupport::NumberHelper.number_to_delimited(income_count)} incomes.",""
  end

  desc "import all lobbying data"
  task all: [:lobbyists, :clients, :incomes, :bill_positions] do
    puts "","ALL LOBBYING DATA IMPORTED"
  end
end
