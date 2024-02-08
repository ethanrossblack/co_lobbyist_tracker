class Lobbyist < ApplicationRecord
  has_many :clients, dependent: :destroy
  has_many :incomes, dependent: :destroy

  def total_income
    incomes.sum(:amount)
  end

  def top_client
    clients.joins(:incomes)
           .group('clients.id')
           .select('clients.name, SUM(incomes.amount) AS total_paid')
           .order('total_paid DESC').first
  end
end
