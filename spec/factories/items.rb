FactoryBot.define do
  factory :item do
    association :user

    name { Faker::Name.name }
    introduction { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 1, to: 10) }
    item_condition_id { Faker::Number.between(from: 1, to: 6) }
    charges_id { Faker::Number.between(from: 1, to: 2) }
    address_id { Faker::Number.between(from: 1, to: 47) }
    preparation_day_id { Faker::Number.between(from: 1, to: 3) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    
  end
end