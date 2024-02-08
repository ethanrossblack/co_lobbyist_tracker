require 'rails_helper'

RSpec.describe Income, type: :model do
  describe 'relationships' do
    it { should belong_to(:lobbyist) }
    it { should belong_to(:client) }
  end
end
