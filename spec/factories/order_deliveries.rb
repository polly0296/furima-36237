FactoryBot.define do
  factory :order_delivery do
    postal_code { '123-4567' }
    source_id { 1 }
    city { '横浜市緑区' }
    house_number { '青山１−１−１' }
    building_name { '柳ビル１０３' }
    phone_number { '09012345678' }
    token {'tok_4a1536657bd6ba6f1a551e0e3505'}
  end
end
