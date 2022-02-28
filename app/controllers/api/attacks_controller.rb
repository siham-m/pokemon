class Api::AttacksController < ApplicationController
  def index
    @attacks = Attack.all
    render json: @attacks
  end

  def show
    @attack = Attack.find(params[:id])
    render json: @attack
  end
end