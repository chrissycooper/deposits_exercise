class TradelinesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    render json: Tradeline.all
  end

  def show
    @tradeline = Tradeline.find(params[:id])
   
    deposits_total = 0
    @tradeline.deposits.each do |deposit|
      deposits_total += deposit.amount
    end

    new_amount = @tradeline.amount - deposits_total

    @tradeline.update(
      amount: new_amount
    )
    
    render json: @tradeline
  end

  def create
    @tradeline = Tradeline.create(
      name: params[:name],
      amount: params[:amount],
    )
    render json: @tradeline
  end

  private

  def not_found
    render json: 'not_found', status: :not_found
  end
end
