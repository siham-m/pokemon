require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it 'displays :new' do
      get :new
      expect(response).to render_template(:new)
  end
end