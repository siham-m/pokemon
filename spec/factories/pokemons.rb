FactoryBot.define do
  factory :pokemon do
    name { Faker::Games::Pokemon.name.parameterize }
    height{ 40 }
    weight{ 6 }
    description{"azer"}
    speed{ 2 }
    defense{ 2 }
    attack{ 2 }
    special_defense{ 2 }
    special_attack{ 2 }
    hp{ 2 }
    french_name { Faker::Games::Pokemon.name.parameterize }
  end
end
