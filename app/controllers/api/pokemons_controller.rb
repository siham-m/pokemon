class Api::PokemonsController < ApplicationController
  def index
    token = request.headers['Authorization']
    if token.nil?
      return render json: { error: 'You must have a token' }
    end
    user = User.find_by(token: token)
    if user.nil?
      return render json: { error: 'Invalid token' }
    end
    @pokemons = Pokemon.all
    render json: @pokemons
  end

  def show
    @pokemon = Pokemon.find_by(name: params[:id])
    render json: @pokemon
  end
end
