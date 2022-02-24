require 'rails_helper'

RSpec.describe PokemonsController, type: :controller do
  context 'when pokemon is not found' do
    it 'raises error' do
      get :show, params: {id: 'test'}
      expect(response.status).to eq(404)
    end
  end

  context 'when pokemon is found' do
    it 'displays :show' do
      pokemon = FactoryBot.create(:pokemon)
      get :show, params: {id: pokemon.name}
      expect(response).to render_template(:show)
    end
    it 'assigns pokemon' do
      pokemon = FactoryBot.create(:pokemon)
      get :show, params: {id: pokemon.name}
      expect(assigns(:pokemon)).to eq(pokemon)
    end
  end
end
