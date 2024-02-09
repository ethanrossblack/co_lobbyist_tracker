require 'rails_helper'

RSpec.describe Lobbyist, type: :model do
  describe 'relationships' do
    it { should have_many(:clients) }
    it { should have_many(:incomes) }
  end

  describe 'instance methods' do
    before do
      @lobbyist_1 = create(:lobbyist)
      @lobbyist_2 = create(:lobbyist)
      
      @client_1 = create(:client, lobbyist: @lobbyist_1)
      
      @income_1 = create(:income, amount: 1000, lobbyist: @lobbyist_1, client: @client_1)
      @income_2 = create(:income, amount: 2000, lobbyist: @lobbyist_1, client: @client_1)
      @income_3 = create(:income, amount: 2000, lobbyist: @lobbyist_2, client: @client_1)
    end

    describe '#total_income' do
      it 'returns the summed income of a lobbyist' do
        expect(@lobbyist_1.total_income).to eq(3000)  
        expect(@lobbyist_2.total_income).to eq(2000)
      end
    end

    describe '#highest_paying_client' do
      it "returns a lobbyist's highest paying client and the total paid amount to the lobbyist from that client" do
        expect(@lobbyist_1.highest_paying_client).to eq(@client_1)
        expect(@lobbyist_1.highest_paying_client.total_paid).to eq(3000)
        
        client_2 = create(:client, lobbyist: @lobbyist_1)
        big_income = create(:income, amount:10000000, lobbyist: @lobbyist_1, client: client_2)

        expect(@lobbyist_1.highest_paying_client).to eq(client_2)
        expect(@lobbyist_1.highest_paying_client.total_paid).to eq(10000000)
      end
    end
  end
end
