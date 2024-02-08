class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :industry_trade_type
      t.string :business_type
      t.date :begin_date
      t.date :end_date
      t.string :status
      t.string :ceo_names
      t.string :fiscal_year
      t.bigint :annual_lobbyist_registration_id
      t.references :lobbyist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
