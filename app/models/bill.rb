class Bill < ApplicationRecord
  has_many :positions, dependent: :destroy
  has_many :clients, through: :positions
  has_many :lobbyists, through: :positions
end
