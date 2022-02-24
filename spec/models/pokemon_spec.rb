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
      FactoryBot.create(:pokemon, name: "Pikachu")
    end.not_to raise_error
    expect do
      FactoryBot.create(:pokemon, name: "Pikachu")
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

  it 'has a picture' do
    expect do
      FactoryBot.create(:pokemon, picture: nil)
    end.to raise_error(ActiveRecord::RecordInvalid)
  end  

  it 'has attacks' do
    attack1 = FactoryBot.create(:attack)
    attack2 = FactoryBot.create(:attack)
    pokemon = FactoryBot.create(:pokemon, attack_names: [attack1.name])
    expect(pokemon.attacks).to eq([attack1])
  end

  it 'has max power' do
    attack1 = FactoryBot.create(:attack, power: 10)
    attack2 = FactoryBot.create(:attack, power: 20)
    pokemon = FactoryBot.create(:pokemon, attack_names: [attack1.name, attack2.name])
    expect(pokemon.max_power).to eq(20)
  end

  it 'has min power' do
    attack1 = FactoryBot.create(:attack, power: 10)
    attack2 = FactoryBot.create(:attack, power: 20)
    pokemon = FactoryBot.create(:pokemon, attack_names: [attack1.name, attack2.name])
    expect(pokemon.min_power).to eq(10)
  end
end
