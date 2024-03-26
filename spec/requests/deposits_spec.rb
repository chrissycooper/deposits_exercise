require 'rails_helper'

RSpec.describe "Deposits", type: :request do
  describe "POST /create" do
    let(:tradeline) { FactoryBot.create :tradeline }
    
    before do
      @deposit = Deposit.new({date_of_deposit: '05/05/2024', amount: 1000.00})
      post "/tradelines/#{tradeline.id}/deposits", params: {date_of_deposit: @deposit.date_of_deposit, amount: @deposit.amount}
      # get "/tradelines/#{tradeline.id}", headers: headers
    end

    it "responds with a success status" do
      expect(response).to be_ok
    end
  end
end
