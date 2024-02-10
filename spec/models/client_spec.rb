require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'relationships' do
    it { should belong_to(:lobbyist) }
    it { should have_many(:incomes) }
  end
end
