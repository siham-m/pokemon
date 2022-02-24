require 'rails_helper'

RSpec.describe PokemonsController, type: :controller do
  context 'when no params type' do
    it 'displays :index' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns pokemons' do
      pokemon1 = FactoryBot.create(:pokemon)
      pokemon2 = FactoryBot.create(:pokemon)
      get :index
      expect(assigns(:pokemons)).to eq([pokemon1, pokemon2])
    end
  end

  context 'when params type' do
    it 'displays :index' do
      get :index, params: {type: "grass"}
      expect(response).to render_template(:index)
    end

    it 'assigns pokemons' do
      pokemon1 = FactoryBot.create(:pokemon, types: ["grass"])
      pokemon2 = FactoryBot.create(:pokemon, types: ["fire"])
      get :index, params: {type: "grass"}
      expect(assigns(:pokemons)).to eq([pokemon1])
    end
  end
end
