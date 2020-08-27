FactoryBot.define do
  factory :item do
    name { 'ペン' }
    discript { Faker::Lorem.sentence }
    category_id { 7 }
    status_id { 2 }
    delivery_fee_id { 2 }
    area_id { 2 }
    delivery_time_id { 2 }
    price { 2000 }
    association :user
  end
end
