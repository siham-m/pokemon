require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'when no logged in' do
    it 'redirects to sessions#new' do
    user = FactoryBot.create(:user)
    get :show, params: {id: user.id}
    expect(response).to redirect_to(new_session_path)
    end
  end

  it 'displays :show' do
    user = FactoryBot.create(:user)
    session[:id] = user.id
    get :show, params: {id: user.id}
    expect(response).to render_template(:show)
  end
  
  it 'assigns user' do
    user = FactoryBot.create(:user)
    session[:id] = user.id
    get :show, params: {id: user.id}
    expect(assigns(:user)).to eq(user)
  end
end