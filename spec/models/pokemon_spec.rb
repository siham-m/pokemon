require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  it 'has valid factory' do
    expect(FactoryBot.build(:pokemon)).to be_valid
    expect(FactoryBot.create(:pokemon)).to be_valid
  end

  it 'has a name'

  it 'has a unique name'

  it 'has a weight'

  it 'has a height'
end
