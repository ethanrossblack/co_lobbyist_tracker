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
    bills_positions_filepath = "db/data/03_13_prof_bills_current_fiscal_year.txt"
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
      bill_num = row[7] #=> billNumber
      bill_info = row[8] #=> billInformation
      fiscal_year = row[14] #=> fiscalYear
      bill = Bill.find_or_create_by(bill_num:bill_num, title:bill_info, fiscal_year:fiscal_year)
      
      lobbyist_id = row[5] #=> primaryLobbyistID
      lobbyist = Lobbyist.find(lobbyist_id) 
    
      client_name = row[9] #=> clientName
      client_zip = row[10] #=> clientZip
      client = lobbyist.clients.find_or_create_by(name: client_name, zip:client_zip)

      # Split the position column in the event that there's a position change
      positions = row[11].split(",") #=> position. Should be no more than 2, maybe 3 if something wild happened.

      client_positions = client.positions.where(bill: bill.id)

      # See if the client has an existing position for this bill
      positions.each do |position|
        # Got help from Chat GPT for this query, but it uses RegEx to split a string into three parts
        # IE "Monitoring 01/14/2024 to 02/01/2024" => [Monitoring, 01/14/2024, 02/01/2024]
        matches = position.strip.match(/^(\S+)\s+(\d{2}\/\d{2}\/\d{4})\s+to\s+(\S+)/)

        position_stance = matches[1]
        position_start_date = Date.strptime(matches[2], '%m/%d/%Y')
        position_end_date = matches[3].strip == "Ongoing" ? nil : Date.strptime(matches[3], '%m/%d/%Y')

        if client_positions.empty?
          existing_position = nil
        else
          existing_position = client_positions.find_by(position: position_stance, start_date: position_start_date)
        end

        # create a new Position if there is no existing one
        if !existing_position
          Position.create!(
            fiscal_year: fiscal_year,
            position: position_stance,
            start_date: position_start_date,
            end_date: position_end_date,
            lobbyist_id: lobbyist_id,
            client_id: client.id,
            bill_id: bill.id
          )
        elsif !existing_position.end_date && position_end_date
          existing_position.update(end_date: position_end_date)
        end
      end

      
      # WHAT HAPPENS IN A SUPPORT, AMEND, SUPPORT POSITION???
    end
    puts "","","   DONE: Imported #{ActiveSupport::NumberHelper.number_to_delimited(Position.count)} positions.",""
  end
end
