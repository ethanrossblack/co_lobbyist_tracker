class ChangePositionStartAndEndDate < ActiveRecord::Migration[7.0]
  def change
    remove_column :positions, :report_month

    add_column :positions, :start_date, :date
    add_column :positions, :end_date, :date
  end
end
