require 'rails_helper'

RSpec.describe Api::BerriesController, type: :controller do
  it 'renders json' do
    berry = FactoryBot.create(:berry)
    user = FactoryBot.create(:user)
    get :show, params: { id: berry.name, token: user.token  }
    body = JSON.parse(response.body)
    expect(body['id']).to eq(berry.id)
  end
end
