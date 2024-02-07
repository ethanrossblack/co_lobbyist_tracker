class Lobbyist < ApplicationRecord
  validates :primary_lobbyist_id, presence: true, uniqueness: true
  
  self.primary_key = :primary_lobbyist_id
end
