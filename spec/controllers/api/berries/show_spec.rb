require 'rails_helper'

RSpec.describe Api::BerriesController, type: :controller do
  it 'renders json' do
    berry = FactoryBot.create(:berry)
    get :show, params: { id: berry.id }
    body = JSON.parse(response.body)
    expect(body['id']).to eq(berry.id)
  end
end
