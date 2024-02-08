class Client < ApplicationRecord
  belongs_to :lobbyist
  has_many :incomes, dependent: :destroy
end
