require 'rails_helper'

RSpec.describe Deposit, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '#initialize' do
    it 'is an instance of deposit' do
      deposit = Deposit.new({date_of_deposit: '05/05/2024', amount: 1000.00})
      expect(deposit).to be_a Deposit
    end

    it 'has a date' do
      deposit = Deposit.new({date_of_deposit: '05/05/2024', amount: 1000.00})
      expect(deposit.date_of_deposit).to eq '05/05/2024'
    end

    it 'has an amount' do
      deposit = Deposit.new({date_of_deposit: '05/05/2024', amount: 1000.00})
      expect(deposit.amount).to eq 1000.00
    end
  end
end
