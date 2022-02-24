class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all.order(:id)
  end

  def show
    @pokemon = Pokemon.find_by(name: params[:id])
    if @pokemon.nil?
      head :not_found
    end
  end

  def search
    
  end
end
