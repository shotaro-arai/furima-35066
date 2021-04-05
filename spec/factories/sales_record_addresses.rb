FactoryBot.define do
  factory :sales_record_address do
    post_code         {"123-4567"}
    prefectures_id    {Faker::Number.between(from: 2, to: 48)}
    city              {Gimei.address.city.kanji}
    address_number    {8-9-10}
    building          {"abcハイツ102"}
    phone_number      {Faker::Number.number(digits: 11)}
    token             {"tok_abcdefghijk00000000000000000"}
  end
end
