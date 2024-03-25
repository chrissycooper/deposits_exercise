require 'rails_helper'

RSpec.describe Deposit, type: :model do

  describe '#initialize' do
    before(:each) do
      @deposit = Deposit.new({date_of_deposit: '05/05/2024', amount: 1000.00})
    end

    it 'is an instance of deposit' do
      expect(@deposit).to be_a Deposit
    end

    it 'has a date' do
      expect(@deposit.date_of_deposit).to eq '05/05/2024'
    end

    it 'has an amount' do
      expect(@deposit.amount).to eq 1000.00
    end
  end
end
