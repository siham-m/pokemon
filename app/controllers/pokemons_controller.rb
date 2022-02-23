class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def import
    response = HTTParty.get('https://pokeapi.co/api/v2/pokemon')
    puts response.body, response.code, response.message, response.headers.inspect
  end
end
