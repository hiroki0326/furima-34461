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
- has_many :delivers


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
- has_one :deliver

## deliversテーブル

| Column               | Type          | Options     |
| -------------------- | ------------- | ----------- |
| postal_code          | integer       | null: false |
| prefecture           | ActiveHash    | null: false |
| municipalities       | string        | null: false |
| address              | string        | null: false |
| building_name        | string        | null: false |
| phone_number         | integer       | null: false |

### Association
- belongs_to :user
- belongs_to :item
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