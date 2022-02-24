require 'rails_helper'

RSpec.describe PokemonsController, type: :controller do
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