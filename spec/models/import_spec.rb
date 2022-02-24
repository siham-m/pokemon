require 'rails_helper'

RSpec.describe Import, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:import)).to be_valid
    expect(FactoryBot.create(:import)).to be_valid
  end

  it 'has a resource' do
    expect do
      FactoryBot.create(:import, resource: nil)
    end.to raise_error(ActiveRecord::RecordInvalid)
  end  

  it 'has a valid resource' do
    expect do
      FactoryBot.create(:import, resource: "test")
    end.to raise_error(ActiveRecord::RecordInvalid)
  end 

  it 'has a duration' do 
    import = FactoryBot.create(:import)
    expect(import.duration).not_to eq(nil)
  end
end
