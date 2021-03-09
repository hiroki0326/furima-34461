FactoryBot.define do
  factory :buy do
    token              { 1 }
    postal_code        { "123-4567" }
    prefecture_id      { 2 }
    municipalities     { "あ" }
    building_name      { "あ" }
    address            { "あ" }
    phone_number       { 11111111111 }
    user_id            { 1 }
    item_id            { 1 }
  end
end
