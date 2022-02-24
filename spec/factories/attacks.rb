FactoryBot.define do
  factory :attack do
    name { Faker::Games::Pokemon.move }
    accuracy { 100 }
    power { 40 }
  end
end
