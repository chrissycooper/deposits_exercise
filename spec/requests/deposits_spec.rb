require 'rails_helper'

RSpec.describe "Deposits", type: :request do
  describe "POST /create" do
    let(:tradeline) { FactoryBot.create :tradeline }
    
    before do
      @deposit = Deposit.new({date_of_deposit: '05/05/2024', amount: 1000.00})
      post "/tradelines/#{tradeline.id}/deposits", params: {date_of_deposit: @deposit.date_of_deposit, amount: @deposit.amount}
    end

    it "responds with a success status" do
      expect(response).to be_ok
    end
  end

  describe "GET /index" do
    let(:tradeline) { FactoryBot.create :tradeline }
    
    before do
      @deposit1 = Deposit.new({date_of_deposit: '05/05/2024', amount: 1000.00})
      @deposit2 = Deposit.new({date_of_deposit: '05/07/2024', amount: 1000.00})
      post "/tradelines/#{tradeline.id}/deposits", params: {date_of_deposit: @deposit1.date_of_deposit, amount: @deposit1.amount}
      post "/tradelines/#{tradeline.id}/deposits", params: {date_of_deposit: @deposit2.date_of_deposit, amount: @deposit2.amount}
      get "/tradelines/#{tradeline.id}/deposits"
    end

    it "responds with a success status" do
      expect(response).to be_ok
    end
  end

  describe "GET /show" do
    let(:tradeline) { FactoryBot.create :tradeline }
    
    before do
      @deposit1 = Deposit.new({date_of_deposit: '05/05/2024', amount: 1000.00})
      @deposit2 = Deposit.new({date_of_deposit: '05/07/2024', amount: 1000.00})
      post "/tradelines/#{tradeline.id}/deposits", params: {date_of_deposit: @deposit1.date_of_deposit, amount: @deposit1.amount}
      post "/tradelines/#{tradeline.id}/deposits", params: {date_of_deposit: @deposit2.date_of_deposit, amount: @deposit2.amount}
      get "/tradelines/#{tradeline.id}/deposits/3"
    end

    it "responds with a failure status" do
      expect(response).to have_http_status(404)
    end
  end
end
