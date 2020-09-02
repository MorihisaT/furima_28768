FactoryBot.define do
  factory :address_order do
    postal_code { '491-0001' }
    area_id { 24 }
    city { '名古屋市' }
    house_number { '栄1ー1' }
    building_name { '森ビル101' }
    phone_number { '09012345678' }
    user_id { 7 }
    item_id { 7 }
  end
end
