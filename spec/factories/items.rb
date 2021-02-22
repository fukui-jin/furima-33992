FactoryBot.define do
  factory :item do
    title {Faker::JapaneseMedia::DragonBall.character}
    description {Faker::Lorem.sentence}
    category_id {2}
    item_condition_id {2}
    delivery_price_id {2}
    prefectures_id {2}
    delivery_time_id {2}
    price {Faker::Number.number(digits: 6)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sea.png'), filename: 'sea.png')
    end
  end
end
