class BillsController < ApplicationController
  before_action :set_bill, only: [:show]

  def index
    @bills = Bill.where("bill_num LIKE 'HB24%' OR bill_num LIKE 'SB24%'").order(:bill_num)
  end

  def show
  end

  private

  def set_bill
    @bill = Bill.find(params[:id])
  end
end