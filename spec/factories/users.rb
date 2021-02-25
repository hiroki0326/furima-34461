FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    up_name               {'上'}
    down_name             {'下'}
    up_name_katakana      {'ウエ'}
    down_name_katakana    {'シタ'}
    birthday              {Faker::Date.birthday}
  end
end