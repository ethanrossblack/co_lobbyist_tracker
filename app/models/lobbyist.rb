class Lobbyist < ApplicationRecord
  has_many :clients, dependent: :destroy
  has_many :incomes, dependent: :destroy
end
