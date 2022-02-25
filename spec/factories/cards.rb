FactoryBot.define do
  factory :card do
    name { Faker::IDNumber.valid }
    pokemon
  end
end
