class TradelinesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    @tradelines = Tradeline.all
    @tradelines.each do |tradeline|
      @tradeline = Tradeline.find(tradeline.id)
      deposits_total = 0

      @tradeline.deposits.each do |deposit|
        deposits_total += deposit.amount
      end

      new_amount = @tradeline.amount - deposits_total

      @tradeline.update(
        outstanding_balance: new_amount
      )
    end

    render json: @tradelines
  end

  def show
    @tradeline = Tradeline.find(params[:id])
   
    deposits_total = 0
    @tradeline.deposits.each do |deposit|
      deposits_total += deposit.amount
    end

    new_amount = @tradeline.amount - deposits_total

    @tradeline.update(
      outstanding_balance: new_amount
    )
    
    render json: @tradeline
  end

  def create
    @tradeline = Tradeline.create(
      name: params[:name],
      amount: params[:amount],
      outstanding_balance: params[:amount]
    )
    render json: @tradeline
  end

  private

  def not_found
    render json: 'not_found', status: :not_found
  end
end
