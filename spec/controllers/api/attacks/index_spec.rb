require 'rails_helper'

RSpec.describe Api::AttacksController, type: :controller do
  it 'renders json' do
    attack1 = FactoryBot.create(:attack)
    attack2 = FactoryBot.create(:attack)
    get :index
    body = JSON.parse(response.body)
    expect(body.length).to eq(2)
  end
end