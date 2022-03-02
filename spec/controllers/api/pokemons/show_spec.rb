require 'rails_helper'

RSpec.describe Api::PokemonsController, type: :controller do
  it 'renders json' do
    pokemon = FactoryBot.create(:pokemon)
    user = FactoryBot.create(:user)
    get :show, params: { id: pokemon.name, token: user.token }
    body = JSON.parse(response.body)
    expect(body['id']).to eq(pokemon.id)
  end
end
