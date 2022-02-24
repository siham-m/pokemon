require 'rails_helper'

RSpec.describe BerriesController, type: :controller do
  it 'displays :index' do
      get :index
      expect(response).to render_template(:index)
  end
  it 'assigns berries' do
    berry1 = FactoryBot.create(:berry)
    berry2 = FactoryBot.create(:berry)
    get :index
    expect(assigns(:berries).pluck(:id).sort).to eq([berry1.id, berry2.id])
  end
end