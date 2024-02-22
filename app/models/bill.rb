class Bill < ApplicationRecord
  has_many :positions
  has_many :clients, through: :positions
  has_many :lobbyists, through: :positions
end
