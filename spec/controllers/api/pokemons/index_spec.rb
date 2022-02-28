require 'rails_helper'

RSpec.describe Api::PokemonsController, type: :controller do
  it 'renders json' do
    pokemon1 = FactoryBot.create(:pokemon)
    pokemon2 = FactoryBot.create(:pokemon)
    get :index
    body = JSON.parse(response.body)
    expect(body.length).to eq(2)
  end
end