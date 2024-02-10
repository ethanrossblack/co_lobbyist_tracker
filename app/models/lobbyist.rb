class Lobbyist < ApplicationRecord
  has_many :clients, dependent: :destroy
  has_many :incomes, dependent: :destroy

  def total_income
    incomes.sum(:amount)
  end

  def highest_paying_client
    clients_by_income_amount.first
  end

  def clients_by_income_amount
    clients.joins(:incomes)
          .where("incomes.lobbyist_id = '#{id}'")
          .group('clients.id')
          .select('clients.*, SUM(incomes.amount) AS total_paid')
          .order('total_paid DESC')
  end
end
