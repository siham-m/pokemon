require 'rails_helper'

RSpec.describe Api::PokemonsController, type: :controller do
  it 'renders json' do
    pokemon = FactoryBot.create(:pokemon)
    get :show, params: { id: pokemon.name }
    body = JSON.parse(response.body)
    expect(body['id']).to eq(pokemon.id)
  end
end
