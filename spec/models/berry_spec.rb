require 'rails_helper'

RSpec.describe Berry, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:berry)).to be_valid
    expect(FactoryBot.create(:berry)).to be_valid
  end
  
  it 'has a name'do 
    expect do
      FactoryBot.create(:berry, name: nil)
    end.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'has a unique name' do
    expect do
      FactoryBot.create(:berry)
    end.not_to raise_error(ActiveRecord::RecordInvalid)
    expect do
      FactoryBot.create(:berry)
    end.to raise_error(ActiveRecord::RecordInvalid)
  end

end
