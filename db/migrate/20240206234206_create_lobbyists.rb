class CreateLobbyists < ActiveRecord::Migration[7.0]
  def change
    create_table :lobbyists, id: false, primary_key: :primary_lobbyist_id do |t|
      t.bigint :primary_lobbyist_id, unique: true
      t.string :lobbyist_name
      t.string :lobbyist_last_name
      t.string :lobbyist_first_name
      t.string :lobbyist_middle_name
      t.string :lobbyist_suffix
      t.string :lobbyist_firm_name
      t.string :lobbyist_address
      t.string :lobbyist_city
      t.string :lobbyist_state
      t.string :lobbyist_zip
      t.string :lobbyist_phone
      t.string :fiscal_years_registered
      t.string :lobbyist_type
      t.string :lobbyist_designation
      t.string :status

      t.timestamps
    end
  end
end
