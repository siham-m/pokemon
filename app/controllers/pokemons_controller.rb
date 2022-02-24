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

  def import
    response = HTTParty.get('https://pokeapi.co/api/v2/pokemon?limit=2000')
    body = JSON.parse(response.body)
    body["results"].each do |result|
      response2 = HTTParty.get(result["url"])
      body2 = JSON.parse(response2.body)
      if !Pokemon.exists?(name: result["name"])
        @pokemon = Pokemon.create!(
        name: result["name"],
        height: body2["height"],
        weight: body2["weight"]
      )
      end
    end
    render json: Pokemon.all
  end
end
