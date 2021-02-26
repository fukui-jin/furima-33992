FactoryBot.define do
  factory :order_buyer do
    token               { 'tok_abcdefghijklmnopq00000000000' }
    postal_code         { '123-4567' }
    prefectures_id      { 2 }
    city                { '神戸市' }
    address             { '秋山1-1' }
    building_name       { '秋山ビル101' }
    phone_number        { '09012345678' }
  end
end