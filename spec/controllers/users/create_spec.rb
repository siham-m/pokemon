require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it 'displays :create' do
    expect(User.count).to eq(0)
    post :create, params: {user: {email: "salut@gmail.com", password: "hello"}}
    expect(User.count).to eq(1)
  end
end
