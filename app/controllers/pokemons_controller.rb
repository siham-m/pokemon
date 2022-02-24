class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find_by(name: params[:id])
    if @pokemon.nil?
      raise "NOT FOUND"
    end
  end
end
