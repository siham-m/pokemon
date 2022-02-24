FactoryBot.define do
  factory :berry do
    name { Faker::Food.fruits }
  end
end
