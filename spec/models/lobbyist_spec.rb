require 'rails_helper'

RSpec.describe Lobbyist, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:primary_lobbyist_id) }
    it { should validate_uniqueness_of(:primary_lobbyist_id) }
  end
end
