class CreateIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes do |t|
      t.bigint :annual_lobbyist_registration_id
      t.string :client_name
      t.string :client_zip
      t.string :business_type
      t.string :industry_trade_type
      t.integer :amount
      t.date :date_received
      t.string :report_month
      t.date :report_due_date
      t.string :fiscal_year
      t.references :lobbyist, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
