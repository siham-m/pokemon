require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  it 'has valid factory' do
    expect(FactoryBot.build(:pokemon)).to be_valid
    expect(FactoryBot.create(:pokemon)).to be_valid
  end

  it 'has a name' do
    expect do
      FactoryBot.create(:pokemon, name: nil)
    end.to raise_error(ActiveRecord::RecordInvalid)
  end
  it 'has a unique name' do
    expect do
      FactoryBot.create(:pokemon)
    end.not_to raise_error
    expect do
      FactoryBot.create(:pokemon)
    end.to raise_error(ActiveRecord::RecordInvalid)
  end
  it 'has a weight' do
    expect do
      FactoryBot.create(:pokemon, weight: nil)
    end.to raise_error(ActiveRecord::RecordInvalid)
  end
  it 'has a height' do
    expect do
      FactoryBot.create(:pokemon, height: nil)
    end.to raise_error(ActiveRecord::RecordInvalid)
  end
end
