require 'rails_helper'

RSpec.describe Card, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:card)).to be_valid
    expect(FactoryBot.create(:card)).to be_valid
  end

  it 'has a name' do
    expect do
      FactoryBot.create(:card, name: nil)
    end.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'has a unique name' do
    expect do
      FactoryBot.create(:card, name: "AZE")
    end.not_to raise_error
    expect do
      FactoryBot.create(:card, name: "AZE")
    end.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'belongs to a pokemon' do
    expect do
      FactoryBot.create(:card, pokemon: nil)
    end.to raise_error(ActiveRecord::RecordInvalid)
  end
end
