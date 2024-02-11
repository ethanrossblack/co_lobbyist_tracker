class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.string :bill_num
      t.string :title
      t.string :fiscal_year

      t.timestamps
    end
  end
end
