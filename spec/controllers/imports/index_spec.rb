require 'rails_helper'

RSpec.describe ImportsController, type: :controller do
  it 'displays :index' do
      get :index
      expect(response).to render_template(:index)
  end
  it 'assigns imports' do
    import1 = FactoryBot.create(:import)
    import2 = FactoryBot.create(:import)
    get :index
    expect(assigns(:imports)).to eq([import1, import2])
  end
end