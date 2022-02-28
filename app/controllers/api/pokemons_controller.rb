class Api::PokemonsController < ApplicationController
  before_action :authenticate_api

  def index
    @pokemons = Pokemon.all
    render json: @pokemons
  end

  def show
    @pokemon = Pokemon.find_by(name: params[:id])
    render json: @pokemon
  end
end
