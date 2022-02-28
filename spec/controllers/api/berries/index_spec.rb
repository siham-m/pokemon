require 'rails_helper'

RSpec.describe Api::BerriesController, type: :controller do
  it 'renders json' do
    berry1 = FactoryBot.create(:berry)
    berry2 = FactoryBot.create(:berry)
    get :index
    body = JSON.parse(response.body)
    expect(body.length).to eq(2)
  end
end