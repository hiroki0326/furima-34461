# テーブル設計

## Usersテーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false, unique: true|
| up_name    | string | null: false |
| down_name  | string | null: false |
| up_name_katakana | string | null: false |
| down_name_katakana  | string | null: false |
| birthday   | date | null: false |
| nickname   | string | null: false |
| encrypted_password  | string | null: false |

### Association
- has_many :items
- has_many :orders


## itemsテーブル

| Column          | Type          | Options     |
| --------------- | ------------- | ----------- |
| item_name       | string        | null: false |
| description     | text          | null: false |
| category_id     | integer       | null: false |
| delivery_fee_id | integer       | null: false |
| status_id       | integer       | null: false |
| delivery_source_id | integer    | null: false |
| days_id         | integer       | null: false |
| price           | integer       | null: false |
| user            | reference     | null: false,foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## deliversテーブル

| Column               | Type          | Options     |
| -------------------- | ------------- | ----------- |
| postal_code          | integer       |             |
| prefecture_id        | integer       | null: false |
| municipalities       | string        | null: false |
| address              | string        | null: false |
| building_name        | string        | null: false |
| phone_number         | string        | null: false |
| user                 | reference     | null: false,foreign_key: true |

### Association
- belongs_to :order

## ordersテーブル

| Column          | Type          | Options     |
| --------------- | ------------- | ----------- |
| user            | reference     | null: false,foreign_key: true |
| item            | reference     | null: false,foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :deliver