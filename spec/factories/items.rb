FactoryBot.define do
  factory :item do
    image           {Faker::Lorem.sentence} 
    item_name       { 'aaa' }
    description     { 'aaa' }
    category_id     { 2 }
    delivery_fee_id { 2 }
    status_id       { 2 }
    prefecture_id   { 2 }
    days_id         { 2 }
    price           { 300 }
    association :user 
  end
end
