FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    text { Faker::Lorem.sentence }
    category_id { 1 }
    status_id { 1 }
    fee_id { 1 }
    source_id { 1 }
    shipday_id { 1 }
    price { Faker::Number.within(range: 300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
