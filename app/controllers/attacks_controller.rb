class AttacksController < ApplicationController
  def index
    @attacks = Attack.all
  end

  def show
    @attack = Attack.find_by(name: params[:id])
    if @attack.nil?
      head :not_found
    end
  end
end