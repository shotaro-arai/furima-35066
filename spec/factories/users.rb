FactoryBot.define do
  factory :user do
    nickname              {Faker::Internet.username}
    email                 {Faker::Internet.email}
    password              {'abc123'}
    password_confirmation {password}
    last_name             {Gimei.name.last}
    first_name            {Gimei.name.first}
    last_name_kana        {Gimei.name.last.katakana}
    first_name_kana       {Gimei.name.first.katakana}
    birthday              {Faker::Date.birthday}
  end
end
