# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

- has_many :items
- has_many :purchases


## items テーブル

| Column                | Type       | Options                       |
| --------------------- | ---------- | ----------------------------- |
| product               | string     | null: false                   |
| category_id           | integer    | null: false                   |
| product_condition_id  | integer    | null: false                   |
| shipping_fee_payer_id | integer    | null: false                   |
| shipping_region_id    | integer    | null: false                   |
| estimated_delivery_id | integer    | null: false                   |
| price                 | integer    | null: false                   |
| user                  | references | null: false,foreign_key: true |
| product_description   | text       | null: false                   |

- belong_to :user
- has_one :purchase

## purchases テーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| item    | references | null: false,foreign_key: true |
| user    | references | null: false,foreign_key: true |

- has_one :address
- belong_to :user
- belong_to :item


## addresses テーブル

| Column                | Type       | Options                       |
| --------------------- | ---------- | ----------------------------- |
| postal_code           | string     | null: false                   |
| shipping_region_id    | integer    | null: false                   |
| city                  | string     | null: false                   |
| street_address        | string     | null: false                   |
| building_name         | string     |                               |
| telephone_number      | string     | null: false                   |
| purchase              | references | null: false,foreign_key: true |

- belongs_to :purchase