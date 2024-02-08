class Income < ApplicationRecord
  belongs_to :lobbyist
  belongs_to :client
end
