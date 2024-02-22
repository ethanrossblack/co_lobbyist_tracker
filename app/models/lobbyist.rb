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
    clients.left_outer_joins(:incomes)
          .select('clients.*, SUM(incomes.amount) as total_paid')
          .group('clients.id')
          .order(Arel.sql('total_paid DESC NULLS LAST, clients.name'))
  end
end
