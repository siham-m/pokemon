require 'rails_helper'

RSpec.describe Import, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:import)).to be_valid
    expect(FactoryBot.create(:import)).to be_valid
  end

  it 'has a duration' do 
    duration1 = FactoryBot.create(:resource, duration: 10)
    expect(import.duration).to eq(10)
  end
end
