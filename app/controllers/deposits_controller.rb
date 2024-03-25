class DepositsController < ApplicationController

  def index
    @tradeline = Tradeline.find(params[:tradeline_id])
    render json: @tradeline.deposits.all
  end

  def create
    @tradeline = Tradeline.find(params[:tradeline_id])

    if @tradeline.outstanding_balance >= params[:amount].to_f
      @deposit = @tradeline.deposits.create(
        date_of_deposit: params[:date_of_deposit],
        amount: params[:amount]
      )
  
      render json: @deposit
    else 
      render json: 'invalid deposit', status: :unprocessable_entity
    end
  end
end
