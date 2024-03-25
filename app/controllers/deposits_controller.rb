class DepositsController < ApplicationController

  def index
    @tradeline = Tradeline.find(params[:tradeline_id])
    render json: @tradeline.deposits.all
  end

  def create
    @tradeline = Tradeline.find(params[:tradeline_id])
    @deposit = @tradeline.deposits.create(
      date_of_deposit: params[:date_of_deposit],
      amount: params[:amount]
    )

    render json: @deposit
  end
end
