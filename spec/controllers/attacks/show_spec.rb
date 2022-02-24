require 'rails_helper'

RSpec.describe AttacksController, type: :controller do
  context 'when attack is not found' do
    it 'raises error' do
      get :show, params: {id: 'test'}
      expect(response.status).to eq(404)
    end
  end

  context 'when attack is found' do
    it 'displays :show' do
      attack = FactoryBot.create(:attack)
      get :show, params: {id: attack.name}
      expect(response).to render_template(:show)
    end
    it 'assigns attack' do
      attack = FactoryBot.create(:attack)
      get :show, params: {id: attack.name}
      expect(assigns(:attack)).to eq(attack)
    end
  end
end
