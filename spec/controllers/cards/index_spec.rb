require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  it 'displays :index' do
      get :index
      expect(response).to render_template(:index)
  end
  it 'assigns cards' do
    card1 = FactoryBot.create(:card)
    card2 = FactoryBot.create(:card)
    get :index
    expect(assigns(:cards)).to eq([card1, card2])
  end
end