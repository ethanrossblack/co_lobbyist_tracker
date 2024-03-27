class Position < ApplicationRecord
  belongs_to :bill
  belongs_to :lobbyist
  belongs_to :client

  enum position: {
    "Supporting": 0,
    "Opposing": 1,
    "Amending": 2,
    "Monitoring": 3
  }
end
