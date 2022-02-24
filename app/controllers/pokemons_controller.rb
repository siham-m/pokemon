class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all.order(:id)
    if params[:type]
      @pokemons = Pokemon.where("'#{params[:type]}' = ANY(types)").order(:id)
    end
    respond_to do |format|
      format.html
      format.csv do
        send_data generate_csv, filename: "pokemons.csv"
      end
    end
  end

  def show
    @pokemon = Pokemon.find_by(name: params[:id])
    if @pokemon.nil?
      head :not_found
    end
  end

  def search
    if params[:name].present?
      pokemon = Pokemon.find_by(name: params[:name].parameterize)
      if pokemon
        redirect_to pokemon_path(pokemon.name)
      end
    end
  end

  private

  def generate_csv
    headers = ['ID', 'Name', 'Weight', 'Height', 'Types']
    CSV.generate do |csv|
      csv << headers
      @pokemons.each do |pokemon|
        csv << [pokemon.id, pokemon.name.titleize, pokemon.weight, pokemon.height, pokemon.types.map { |type| type.titleize }.join(', ')]
      end
    end
  end
end
