class TradelinesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    render json: Tradeline.all
  end

  def show
    render json: Tradeline.find(params[:id])
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
