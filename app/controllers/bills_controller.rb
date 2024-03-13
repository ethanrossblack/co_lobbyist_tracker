class BillsController < ApplicationController  
  def index
    @bills = Bill.where("bill_num LIKE 'HB24%' OR bill_num LIKE 'SB24%'").order(:bill_num)
  end
end