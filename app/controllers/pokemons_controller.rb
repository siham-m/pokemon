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
    if params[:name].present?
      pokemon = Pokemon.find_by(name: params[:name])
      if pokemon
        redirect_to pokemon_path(pokemon.name)
      end
    end
  end
end
