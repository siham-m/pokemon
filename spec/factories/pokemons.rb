FactoryBot.define do
  factory :pokemon do
    name { Faker::Games::Pokemon.name }
    height{ 40 }
    weight{ 6 }
  end
end