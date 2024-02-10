class RenameLobbyistColumns < ActiveRecord::Migration[7.0]
  def change
    change_table :lobbyists do |t|
      t.rename :lobbyist_name, :name
      t.rename :lobbyist_last_name, :last_name
      t.rename :lobbyist_first_name, :first_name
      t.rename :lobbyist_middle_name, :middle_name
      t.rename :lobbyist_suffix, :suffix
      t.rename :lobbyist_firm_name, :firm_name
      t.rename :lobbyist_address, :address
      t.rename :lobbyist_city, :city
      t.rename :lobbyist_state, :state
      t.rename :lobbyist_zip, :zip
      t.rename :lobbyist_phone, :phone
      t.rename :lobbyist_designation, :designation
    end
  end
end
