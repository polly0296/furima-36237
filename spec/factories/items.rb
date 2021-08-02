FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    text { Faker::Lorem.sentence }
    category { Category.all.sample }
    status { Status.all.sample }
    fee { Fee.all.sample }
    source { Source.all.sample }
    shipday { Shipday.all.sample }
    price { Faker::Number.within(range: 300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
