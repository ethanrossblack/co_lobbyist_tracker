require 'rails_helper'

RSpec.describe Lobbyist, type: :model do
  describe 'relationships' do
    it { should have_many(:clients) }
    it { should have_many(:incomes) }
  end
end
