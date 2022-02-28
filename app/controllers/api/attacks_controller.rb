class Api::AttacksController < ApplicationController
  before_action :authenticate_api

  def index
    @attacks = Attack.all
    render json: @attacks
  end

  def show
    @attack = Attack.find_by(name: params[:id])
    render json: @attack
  end
end