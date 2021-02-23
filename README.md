# テーブル設計

## Usersテーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| full_name  | string | null: false |
| birthday   | string | null: false |
| nickname   | string | null: false |

### Association
- has_many :items
- has_many :buys

## itemsテーブル

| Column          | Type          | Options     |
| --------------- | ------------- | ----------- |
| item_name       | string        | null: false |
| description     | text          | null: false |
| category        | ActiveHash    | null: false |
| delivery_fee    | ActiveHash    | null: false |
| status          | ActiveHash    | null: false |
| delivery_source | ActiveHash    | null: false |
| days            | ActiveHash    | null: false |
| price           | integer       | null: false |
| user            | reference     | null: false |

### Association
- belongs_to :user
- has_one :buy

## buysテーブル

| Column               | Type          | Options     |
| -------------------- | ------------- | ----------- |
| credit_card          | integer       | null: false |
| credit_card_deadline | integer       | null: false |
| security_code        | integer       | null: false |
| postal_code          | integer       | null: false |
| prefecture           | ActiveHash    | null: false |
| municipalities       | string        | null: false |
| address              | string        | null: false |
| building_name        | string        | null: false |
| phone_number         | integer       | null: false |
| user                 | reference     | null: false |

### Association
- belongs_to :user
- belongs_to :item