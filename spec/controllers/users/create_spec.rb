require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it 'displays :create' do
    get :create, params: {email: user.email, password: user.password, token: user.token}
    user = FactoryBot.create(:user)
  end
end
