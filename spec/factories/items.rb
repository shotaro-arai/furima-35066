FactoryBot.define do
  factory :item do
    name              {"都会の写真 10枚セット"}
    description       {"テストtestてすと"}
    category_id       {Faker::Number.between(from: 2, to: 11)}
    condition_id      {Faker::Number.between(from: 2, to: 7)}
    delivery_fee_id   {Faker::Number.between(from: 2, to: 3)}
    prefectures_id    {Faker::Number.between(from: 2, to: 48)}
    term_to_send_id   {Faker::Number.between(from: 2, to: 4)}
    price             {Faker::Number.between(from: 300, to: 9999999)}
    association :user
  
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'),filename: 'test_image.jpg')
    end
  end
end
