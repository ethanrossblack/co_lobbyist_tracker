class Position < ApplicationRecord
  belongs_to :bill
  belongs_to :lobbyist
  belongs_to :client
end
