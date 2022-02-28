require 'rails_helper'

RSpec.describe Api::AttacksController, type: :controller do
  it 'renders json' do
    attack = FactoryBot.create(:attack)
    get :show, params: { id: attack.id }
    body = JSON.parse(response.body)
    expect(body['id']).to eq(attack.id)
  end
end
