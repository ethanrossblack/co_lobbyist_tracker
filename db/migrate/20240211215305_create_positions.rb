class CreatePositions < ActiveRecord::Migration[7.0]
  def change
    create_table :positions do |t|
      t.string :report_month
      t.string :fiscal_year
      t.string :position
      t.references :bill, null: false, foreign_key: true
      t.references :lobbyist, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
