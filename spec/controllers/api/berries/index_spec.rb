require 'rails_helper'

RSpec.describe Api::BerriesController, type: :controller do
  it 'renders json' do
    berry1 = FactoryBot.create(:berry)
    berry2 = FactoryBot.create(:berry)
    user = FactoryBot.create(:user)
    get :index, params: { token: user.token }
    body = JSON.parse(response.body)
    expect(body.length).to eq(2)
  end
end