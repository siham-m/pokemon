require 'rails_helper'

RSpec.describe AttacksController, type: :controller do
  it 'displays :index' do
      get :index
      expect(response).to render_template(:index)
  end
  it 'assigns attacks' do
    attack1 = FactoryBot.create(:attack)
    attack2 = FactoryBot.create(:attack)
    get :index
    expect(assigns(:attacks).pluck(:id).sort).to eq([attack1.id, attack2.id])
  end
end