class Client < ApplicationRecord
  belongs_to :lobbyist
  has_many :incomes, dependent: :destroy
  has_many :positions
  has_many :bills, through: :positions

  def total_income
    incomes.sum(:amount)
  end

  def self.sum_incomes
    joins(:incomes).select('clients.*, SUM(incomes.amount) as total_paid').order('total_paid DESC')
  end
end
