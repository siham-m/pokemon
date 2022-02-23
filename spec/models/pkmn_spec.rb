require 'rails_helper'

RSpec.describe Pkmn, type: :model do
  it 'has valid factory' do
    expect(FactoryBot.build(:pkmn)).to be_valid
    expect(FactoryBot.create(:pkmn)).to be_valid
  end
end
