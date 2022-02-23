require 'rails_helper'

RSpec.describe Attack, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:attack)).to be_valid
    expect(FactoryBot.create(:attack)).to be_valid
  end
  it 'has a name' do 
    expect do
      FactoryBot.create(:attack, name: nil)
    end.to raise_error(ActiveRecord::RecordInvalid)
  end
  it 'has a unique name' do
    expect do
      FactoryBot.create(:attack)
    end.not_to raise_error
    expect do
      FactoryBot.create(:attack)
    end.to raise_error(ActiveRecord::RecordInvalid)
  end
end
