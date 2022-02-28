require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it 'displays :show' do
    user = FactoryBot.create(:user)
    get :show, params: {id: user.id}
    expect(response).to render_template(:show)
  end
  
  it 'assigns user' do
    user = FactoryBot.create(:user)
    get :show, params: {id: user.id}
    expect(assigns(:user)).to eq(user)
  end
end