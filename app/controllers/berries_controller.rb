class BerriesController < ApplicationController
  def index
    @berries = Berry.all
  end
end