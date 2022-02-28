require 'rails_helper'

RSpec.describe User, type: :model do
    it 'has a valid factory' do
      expect(FactoryBot.build(:user)).to be_valid
      expect(FactoryBot.create(:user)).to be_valid
    end
  
    it 'has an email' do
      expect do
        FactoryBot.create(:user, email: nil)
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  
    it 'has a unique email' do
      expect do
        FactoryBot.create(:user, email: "siham@gmail.com")
      end.not_to raise_error
      expect do
        FactoryBot.create(:user, email: "siham@gmail.com")
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  
    it 'has a password' do
      expect do
        FactoryBot.create(:user, password: nil)
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'has a unique password' do
      expect do
        FactoryBot.create(:user, password: "azerty")
      end.not_to raise_error
      expect do
        FactoryBot.create(:user, password: "azerty")
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'has a token' do
      expect do
        FactoryBot.create(:user, token: nil)
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'has a unique token' do
      expect do
        FactoryBot.create(:user, token: "ABC")
      end.not_to raise_error
      expect do
        FactoryBot.create(:user, token: "ABC")
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

end
