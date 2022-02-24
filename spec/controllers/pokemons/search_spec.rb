require 'rails_helper'

RSpec.describe PokemonsController, type: :controller do
  context 'when no param' do
    it 'displays search' do
      get :search
      expect(response).to render_template(:search)
    end
  end
  context 'when param' do
    context 'when pokemon found' do
      it 'redirect to pokemon page' do
        pokemon = FactoryBot.create(:pokemon)
        get :search, params: {name: pokemon.name}
        expect(response).to redirect_to(pokemon_path(pokemon.name))
      end
    end
    context 'when pokemon not found' do
      it 'displays search' do
        get :search, params: {name:"aze"}
        expect(response).to render_template(:search)
      end
    end
  end
end
