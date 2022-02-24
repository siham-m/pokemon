require 'rails_helper'

RSpec.describe PokemonsController, type: :controller do
  context 'when pokemon is not found' do
    it 'raises error' do
    end
  end
  context 'when pokemon is found' do
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
end
