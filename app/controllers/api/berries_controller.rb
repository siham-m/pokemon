class Api::BerriesController < ApplicationController
  before_action :authenticate_api

  def index
    @berries = Berry.all
    render json: @berries
  end

  def show
    @berry = Berry.find_by(name: params[:id])
    render json: @berry
  end
end
