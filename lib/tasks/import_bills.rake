namespace :import_data do
  desc "load Bill position data from a .txt file"
  task bill_positions: :environment do
    # Not as Fancy Loading Header
    puts "=" * 79
    puts "|" + " CLIENT BILL POSITIONS ".center(77) + "|"
    puts "=".center(79, "="),""

    # Destroy previous 
    puts "* Destroying previous bill and positions data..."
    Position.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!('positions')

    # Open text file of incomes
    puts "* Reading through bill positions seed file ..."
    bills_positions_filepath = "db/data/prof_bills_current_fiscal_year_2_11.txt"
    bill_position_seeds = File.readlines(bills_positions_filepath)

    # First line of the file is the header, which looks like this:
    # lobbyistName	lobbystLastName	lobbyistFirstName	lobbyistFirmName	lobbyistZip	primaryLobbyistID	annualLobbyistRegistrationID	billNumber	billInformation	clientName	clientZip	position	reportMonth	reportDueDate	fiscalYear	runDate
    
    # Iterate through each line in the file and to create position objects and bills (where necessary)
    puts "* Creating bill and position entries...", ""

    # Fancy variables for the loading animation
    total_positions = bill_position_seeds.count - 1
    bill_position_count = 0

    bill_position_seeds[1..].each do |row|
      row = row.split("\t")

      # Find the associated Bill. If the bill exists, continue. If not, create a new Bill
      bill_num = row[7] #billNumber
      bill_info = row[8] #billInformation
      fiscal_year = row[14] #fiscalYear
      
      bill = Bill.find_or_create_by(bill_num:bill_num, title:bill_info, fiscal_year:row[14])
      
      lobbyist = Lobbyist.find(row[5]) # primaryLobbyistID
    
      client_name = row[9] #clientName
      client = lobbyist.clients.find_or_create_by(name: client_name, zip:row[10])

      Position.create!(
        report_month: row[12].strip,
        fiscal_year: row[14],
        position: row[11],
        lobbyist_id: row[5],
        client_id: client.id,
        bill_id: bill.id
      )
      
      bill_position_count += 1
      percent_done = (bill_position_count.to_f / total_positions)
      progress_bar = "=" * (percent_done * 59).round
      printf("\rLOADING: [%-59s] (%5.1f%%)", progress_bar, percent_done * 100)
    end
    puts "","","   DONE: Imported #{ActiveSupport::NumberHelper.number_to_delimited(bill_position_count)} positions.",""
  end
end
